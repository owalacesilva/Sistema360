RSpec.configure do |config|
  config.before(:suite) do
    # DatabaseCleaner.clean_with(:deletion)
    DatabaseCleaner.clean_with(:truncation)
    # This loading seed before each suite
    load Rails.root.join("db/seeds.rb")
  end

  config.before(:each) do
    DatabaseCleaner.strategy = :transaction
  end

  config.before(:each, :js => true) do
    DatabaseCleaner.strategy = :deletion
  end

  config.before(:each) do
    DatabaseCleaner.start
  end

  config.after(:each) do
    DatabaseCleaner.clean
  end
end
