require_relative "boot"

require "rails"
# Pick the frameworks you want:
require "active_model/railtie"
require "active_job/railtie"
require "active_record/railtie"
# require "active_storage/engine"
require "action_controller/railtie"
require "action_mailer/railtie"
# require "action_mailbox/engine"
# require "action_text/engine"
require "action_view/railtie"
require "action_cable/engine"
require "rails/test_unit/railtie"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Backend
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 7.0

    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    # config.time_zone = "Central Time (US & Canada)"
    # config.eager_load_paths << Rails.root.join("extras")

    config.hosts << "a848d06f39c6b49aba4263894e84e454-795743795.us-east-1.elb.amazonaws.com"
    config.hosts << "ac3190cb4d0ea46b5ae8e4562e28045e-990658469.us-east-1.elb.amazonaws.com"
    config.hosts << "k8s-rubybe-rubybein-c608ba26fb-1007715162.us-east-1.elb.amazonaws.com"
    config.hosts << "api.wishbliss.link"

    # config.web_console.permissions = '192.168.0.0/16'
    config.web_console.whitelisted_ips = '192.168.0.0/16', '172.0.0.0/8', '0.0.0.0/0'
    # config.web_console.whitelisted_ips << '172.0.0.0/24'
  end
end
