module Proxly
  class TagHelper
    extend ActionView::Helpers::AssetTagHelper

    def self.javascript_include_tag(*sources)
      super(*sources)
    end
  end
end
