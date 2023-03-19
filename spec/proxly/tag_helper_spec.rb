require "rails_helper"

module Proxly
  RSpec.describe TagHelper do
    it "returns the script tag with no changes" do
      expect(
        TagHelper.javascript_include_tag "application",
                                         "data-turbo-track": "reload",
                                         defer: true
      ).to eq "<script src=\"/javascripts/application.js\" data-turbo-track=\"reload\" defer=\"defer\"></script>"
    end

    it "returns the script tag with the host set to the configured host" do
      Proxly.proxy_host = "test-host.cloudflare.com"

      expect(
        TagHelper.javascript_include_tag "application",
                                         "data-turbo-track": "reload",
                                         defer: true
      ).to eq "<script src=\"https://#{Proxly.proxy_host}/javascripts/application.js\" data-turbo-track=\"reload\" defer=\"defer\"></script>"
    end
  end
end
