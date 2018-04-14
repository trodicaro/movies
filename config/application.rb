require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Movies
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.1

    config.time_zone = 'Central Time (US & Canada)'

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

  end
end

BusinessTime::Config.work_week = [:sun, :mon, :tue, :wed, :thu, :fri, :sat]
BusinessTime::Config.beginning_of_workday = "10:00 am"
BusinessTime::Config.end_of_workday = "11:00 pm"
