require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Monochords
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.0

    config.generators do |g|
      g.test_framework :rspec,
        fixtures: true,
        controller_specs: false,
        view_specs: false,
        helper_specs: false,
        routing_specs: false,
        request_specs: true
    end

    # タイムゾーンを日本時間に設定
    config.time_zone = 'Asia/Tokyo'
    #ロケールを日本に設定
    config.i18n.default_locale = :ja

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.

    config.i18n.default_locale = :ja
  end
end

