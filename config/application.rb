require_relative "boot"
require "openai"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module ElevaAssist
  class Application < Rails::Application
    config.generators do |generate|
      generate.assets false
      generate.helper false
      generate.test_framework :test_unit, fixture: false

    end
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 7.0

    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    # config.time_zone = "Central Time (US & Canada)"
    # config.eager_load_paths << Rails.root.join("extras")
    OpenAI.configure do |config|
      config.access_token = ENV.fetch("OPENAI_ACCESS_TOKEN")
      # config.organization_id = ENV.fetch("OPENAI_ORGANIZATION_ID", nil) # Opcional.
    end
    # client = OpenAI::Client.new(access_token: "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")

  end
end
