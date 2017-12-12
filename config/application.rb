require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Colchonet
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.1

    # Set Time.zone default to the specified zone
    #   and make Active Record auto-convert to this zone.
    # Run "rake -D time" for a list of
    #   tasks for finding time zone names. Default in UTC
    config.time_zone = 'Brasilia'

    # The default locale is :en and all
    #   translations from config/locales/*rb.yml are auto loaded.
    # Rails.applications.config.i18n.load-path
    #   += Dir[Rails.root.join('my', 'locales', '*.{rb.yml}').to_s]
    config.i18n.default_locale = :pt

  end
end
