module Proxly
  module HostRouter
    extend ActiveSupport::Concern

    included { before_action :set_asset_host }

    def set_asset_host
      self.asset_host = Proxly.host unless request.local?
    end
  end
end
