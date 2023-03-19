module Proxly
  class Railtie < ::Rails::Railtie
    initializer "proxly.tag_helper" do
      ActiveSupport.on_load(:action_view) { include Proxly::TagHelper }
    end
  end
end
