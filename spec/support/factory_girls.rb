# Add additional requires below this line. Rails is not loaded until this point!
require "factory_bot_rails"

RSpec.configure do |config|
  config.include FactoryBot::Syntax::Methods

  # The suffix option allows you to customize the name of the generated file with a suffix:
  config.generators do |g|
    g.factory_bot suffix: "factory"
  end
end
