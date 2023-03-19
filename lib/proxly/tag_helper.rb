module Proxly
  module TagHelper
    extend ActionView::Helpers::AssetTagHelper

    # def proxly_javascript_include_tag(*sources)
    #   if Proxly.host && !request.local?
    #     sources.last[:host] = Proxly.host
    #     sources.last[:protocol] = Proxly.protocol
    #   end

    #   javascript_include_tag(*sources)
    # end

    # def proxly_stylesheet_link_tag(*sources)
    #   if Proxly.host && !request.local?
    #     sources.last[:host] = Proxly.host
    #     sources.last[:protocol] = Proxly.protocol
    #   end

    #   stylesheet_link_tag(*sources)
    # end
  end
end
