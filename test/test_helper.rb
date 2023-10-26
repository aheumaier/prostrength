ENV['RAILS_ENV'] ||= 'test'
require_relative '../config/environment'
require 'rails/test_help'

class ActiveSupport::TestCase
  include Devise::Test::IntegrationHelpers
  include Warden::Test::Helpers

  # Run tests in parallel with specified workers
  parallelize(workers: :number_of_processors)

  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :workouts, :workout_sets, :exercises, :users

  # Add more helper methods to be used by all tests here...
  #
  def log_in_as(user)
    if integration_test?
      # user warden helper
      login_as(user, scope: :user)
    else
      sign_in(user)
    end
  end
end
