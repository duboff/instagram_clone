# This file is copied to spec/ when you run 'rails generate rspec:install'
ENV["RAILS_ENV"] ||= 'test'
require File.expand_path("../../config/environment", __FILE__)
require 'rspec/rails'
require 'rspec/autorun'
require 'capybara/rspec'
require 'capybara/poltergeist'
require 'capybara/email/rspec'
require 'database_cleaner'

# Requires supporting ruby files with custom matchers and macros, etc,
# in spec/support/ and its subdirectories.
Dir[Rails.root.join("spec/support/**/*.rb")].each { |f| require f }
Capybara.javascript_driver = :poltergeist

Capybara.server do |app, port|
  require 'rack/handler/thin'
  Rack::Handler::Thin.run(app, :Port => port)
end

# Checks for pending migrations before tests are run.
# If you are not using ActiveRecord, you can remove this line.
ActiveRecord::Migration.maintain_test_schema!

RSpec.configure do |config|
  config.include FactoryGirl::Syntax::Methods
  config.include Warden::Test::Helpers
  Warden.test_mode!

  config.before(:suite) do
    DatabaseCleaner.clean_with(:truncation)
  end

  config.before(:each) do
    DatabaseCleaner.strategy = :transaction
  end

  config.before(:each, :js => true) do
    DatabaseCleaner.strategy = :truncation
  end

  config.before(:each) do
    DatabaseCleaner.start
  end

  config.after(:each) do
    Capybara.reset_sessions!
    DatabaseCleaner.clean
  end
  # ## Mock Framework
  #
  # If you prefer to use mocha, flexmock or RR, uncomment the appropriate line:
  #
  # config.mock_with :mocha
  # config.mock_with :flexmock
  # config.mock_with :rr

  # Remove this line if you're not using ActiveRecord or ActiveRecord fixtures
  config.fixture_path = "#{::Rails.root}/spec/fixtures"

  # If you're not using ActiveRecord, or you'd prefer not to run each of your
  # examples within a transaction, remove the following line or assign false
  # instead of true.
  config.use_transactional_fixtures = false
  # so Poltergeist works

  # If true, the base class of anonymous controllers will be inferred
  # automatically. This will be the default behavior in future versions of
  # rspec-rails.
  config.infer_base_class_for_anonymous_controllers = false
end

def add_post
  visit '/posts/new'
  fill_in 'Description', with: 'sss'
  attach_file 'Picture', Rails.root.join('spec/images/kitten.jpeg')
  click_button 'Post image'
end

def add_post_with_tags
  visit '/posts/new'
  fill_in 'Description', with: 'Testing a kitten'
  fill_in 'Tags', with: '#kitten #cute'
  attach_file 'Picture', Rails.root.join('spec/images/kitten.jpeg')
  click_button 'Post image'
end


def login_as_test_user
  visit '/users/sign_in'
  fill_in 'Email', with: 'user1@example.com'
  fill_in 'Password', with: '12345678'
  click_button 'Sign in'
end
