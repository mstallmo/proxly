require "rails_helper"

module Proxly
  RSpec.describe TagHelper do
    context "with no host set" do
      describe "javascript_include_tag" do
        it "returns the script tag with no changes" do
          expect(
            described_class.javascript_include_tag(
              "application",
              "data-turbo-track": "reload",
              defer: true,
            ),
          ).to eq "<script src=\"/javascripts/application.js\" data-turbo-track=\"reload\" defer=\"defer\"></script>"
        end
      end

      describe "stylesheet_link_tag" do
        it "returns the style tag with no changes" do
          expect(
            described_class.stylesheet_link_tag(
              "application",
              "data-turbo-track": "reload",
              defer: true,
            ),
          ).to eq "<link rel=\"stylesheet\" href=\"/stylesheets/application.css\" data-turbo-track=\"reload\" defer=\"defer\" />"
        end
      end
    end

    context "with a host set" do
      before { Proxly.host = "test-host.cloudflare.com" }

      after { Proxly.host = nil }

      describe "javascript_include_tag" do
        it "returns the script tag with the host set to the configured host" do
          expect(
            described_class.javascript_include_tag(
              "application",
              "data-turbo-track": "reload",
              defer: true,
            ),
          ).to eq "<script src=\"https://#{Proxly.host}/javascripts/application.js\" data-turbo-track=\"reload\" defer=\"defer\"></script>"
        end
      end

      describe "stylesheet_link_tag" do
        it "returns the style tag with the host set to the configured host" do
          expect(
            described_class.stylesheet_link_tag(
              "application",
              "data-turbo-track": "reload",
              defer: true,
            ),
          ).to eq "<link rel=\"stylesheet\" href=\"https://#{Proxly.host}/stylesheets/application.css\" data-turbo-track=\"reload\" defer=\"defer\" />"
        end
      end
    end
  end
end
