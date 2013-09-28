ENV['RACK_ENV'] = 'test'

require File.join(File.dirname(__FILE__), '..', '..', './app/chitter_app.rb')

require 'capybara'
require 'capybara/cucumber'
require 'rspec'
require 'database_cleaner'
require 'database_cleaner/cucumber'

Capybara.app = Chitter

DatabaseCleaner.strategy = :truncation

Before do
  DatabaseCleaner.start
end

After do |scenario|
  DatabaseCleaner.clean
end

class ChitterWorld
  include Capybara::DSL
  include RSpec::Expectations
  include RSpec::Matchers
end

World do
  ChitterWorld.new
end
