require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Prostrength
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 7.0

    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    config.time_zone = 'Berlin'
    # config.eager_load_paths << Rails.root.join("extras")
    #
    config.beginning_of_week = :monday

    # config.logger = Logger.new(STDOUT)
    #
    #
    # config.action_controller.use_custom_csrf_token = lambda do |request|
    #   request.cookies['csrf_token'] = Encryption.encrypt(request.session[:_csrf_token])
    # end
  end
end
