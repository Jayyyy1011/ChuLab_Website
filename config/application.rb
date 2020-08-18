require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module ChuLabWebsite
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
    config.time_zone = "Taipei"
    config.i18n.default_locale = "zh-TW"
  end
end

Time::DATE_FORMATS.merge!(:default => '%Y/%m/%d %I:%M %p', :ymd => '%Y/%m/%d')
