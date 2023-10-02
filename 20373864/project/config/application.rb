require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Project
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 7.0

    config.middleware.insert_before 0, Rack::Cors, :debug => true, :logger => (-> { Rails.logger }) do
      allow do
        # origins ['http://localhost:3000']
        origins ['http://127.0.0.1:5173']
        resource '*',
                 :headers => ['Origin', 'X-Requested-With', 'Content-Type', 'Accept', 'Authorization'],
                 :methods => [:get, :post, :delete, :put, :options, :head, :patch],
                 :max_age => 0,
                 :credentials => true,
                 :expose => ['Set-Cookie']
      end
    end

    config.encoding = "utf-8"
    # logger
    # config.logger = Logger.new(STDOUT)

    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    # config.time_zone = "Central Time (US & Canada)"
    # config.eager_load_paths << Rails.root.join("extras")
  end
end
