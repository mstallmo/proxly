# require_relative "./tunnels/cloudflare"

# TODO:
# - Try to implement auto-start stop in the gem
# - Set `asset_host` per request based on the context
#   - Automtically get included with app controllers

module Proxly
  class Railtie < ::Rails::Railtie
    initializer "proxly.tag_helper", after: :load_config_initializers do
      unless Rails.env.production?
        ActiveSupport.on_load(:action_view) do
          ActionView::Helpers::AssetTagHelper.include(Proxly::TagHelper)
        end
        config.action_controller.asset_host = Proxly.host

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
