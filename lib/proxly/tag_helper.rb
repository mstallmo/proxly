module Proxly
  class TagHelper
    extend ActionView::Helpers::AssetTagHelper

    def self.javascript_include_tag(*sources)
      if Proxly.proxy_host
        sources.last[:host] = Proxly.proxy_host
        sources.last[:protocol] = Proxly.proxy_protocol
      end

      super(*sources)
    end
  end
end
