# frozen_string_literal: true
# @see https://hint.io/blog/rails-system-test-docker

RSpec.configure do |config|
  headless = ENV.fetch('HEADLESS', true) != 'false'

  config.before(:each, type: :system) do
    driven_by :rack_test
  end

  config.before(:each, type: :system, js: true) do
    url = if headless
            "http://#{ENV['SELENIUM_REMOTE_HOST']}:4444/wd/hub"
          else
            'http://host.docker.internal:9515'
          end

    capabilities = Selenium::WebDriver::Remote::Capabilities.chrome({
      chromeOptions: { 
        args: [
          '--log-level=3', # INFO = 0, WARNING = 1, LOG_ERROR = 2, LOG_FATAL = 3
          '--headless', 
          '--no-default-browser-check', 
          '--no-sandbox', 
          '--start-maximized', 
          '--disable-dev-shm-usage',
          '--whitelisted-ips',
        ]
      }
    })

    driven_by :selenium, using: :chrome, screen_size: [1400, 1400], options: {
      browser:              :remote,
      url:                  url,
      desired_capabilities: capabilities
    }

    Capybara.server = :puma, { Silent: true }
    Capybara.server_host = if headless
                             `/sbin/ip route|awk '/scope/ { print $9 }'`.strip
                           else
                             '0.0.0.0'
                           end
    Capybara.server_port = '43447'
    session_server       = Capybara.current_session.server
    Capybara.app_host    = "http://#{session_server.host}:#{session_server.port}"
  end

  config.after(:each, type: :system, js: true) do
    page.driver.browser.manage.logs.get(:browser).each do |log|
      case log.message
        when /This page includes a password or credit card input in a non-secure context/
          # Ignore this warning in tests
          next
        else
          message = "[#{log.level}] #{log.message}"
          raise message
      end
    end
  end
end
