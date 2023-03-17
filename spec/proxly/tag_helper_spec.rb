require "rails_helper"

module Proxly
  RSpec.describe TagHelper do
    it "should return the link tag value" do
      expect(
        TagHelper.javascript_include_tag "application",
                                         "data-turbo-track": "reload",
                                         defer: true
      ).to eq "<script src=\"/javascripts/application.js\" data-turbo-track=\"reload\" defer=\"defer\"></script>"
    end
  end
end
