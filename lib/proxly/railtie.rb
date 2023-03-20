# require_relative "./tunnels/cloudflare"

# TODO:
# - Try to implement auto-start stop in the gem

module Proxly
  class Railtie < ::Rails::Railtie
    initializer "proxly.host_router", after: :load_config_initializers do
      unless Rails.env.production?
        ActiveSupport.on_load(:action_controller_base) do
          include Proxly::HostRouter
        end

        # at_exit do
        #   begin
        #     Tunnels::Cloudflare.stop
        #   rescue => e
        #     puts "There was an #{e} while stopping cloudflare tunnel..."
        #   ensure
        #     puts "Tunnel shutdown"
        #   end
        # end
      end
    end
  end
end
