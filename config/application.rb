require_relative "boot"
require 'bundler'
require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module NotebookApi
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 7.0

    config.i18n.default_locale = :'pt-BR'
    config.time_zone = 'Brasilia'
    config.api_only = true
  end
end
