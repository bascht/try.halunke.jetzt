require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module TryHalunkeJetzt
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.1
    config.rvt.whitelisted_ips = %w( 127.0.0.1 192.168.121.1 192.168.121.136 )
    config.rvt.default_mount_path = '/try'
    #config.rvt.command = 'bundle exec halunke'
    config.rvt.command = "docker run --rm -ti --read-only --tmpfs /run --tmpfs /tmp halunke:latest"
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
  end
end
