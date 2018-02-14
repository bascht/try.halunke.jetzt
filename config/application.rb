require_relative 'boot'

require 'action_controller/railtie'
require 'action_cable/engine'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module TryHalunkeJetzt
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.rvt.automount = false
    config.load_defaults 5.1
    config.rvt.whitelisted_ips = [ '0.0.0.0/0', '[::]/0' ]
    config.rvt.command = "docker run --rm -ti --read-only --label is_a_repl --tmpfs /run --tmpfs /tmp #{ENV['HALUNKE_IMAGE']}"

    config.action_dispatch.default_headers = {
      'X-Frame-Options' => 'ALLOWALL'
    }
    initializer "load_environment_config" do |app|
      app.routes.append do
        mount RVT::Engine => '/repl'
      end
    end
  end
end
