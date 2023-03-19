module Proxly
  class TagHelper
    extend ActionView::Helpers::AssetTagHelper

    def self.javascript_include_tag(*sources)
      if Proxly.host
        sources.last[:host] = Proxly.host
        sources.last[:protocol] = Proxly.protocol
      end

      super(*sources)
    end

    def self.stylesheet_link_tag(*sources)
      if Proxly.host
        sources.last[:host] = Proxly.host
        sources.last[:protocol] = Proxly.protocol
      end

      super(*sources)
    end
  end
end
