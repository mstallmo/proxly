require "proxly/version"
require "proxly/railtie"
require "proxly/tag_helper"

module Proxly
  mattr_accessor :host, :port
  mattr_accessor :protocol, default: "https"

  def self.setup
    yield self
  end

  def self.start
    Tunnels::Cloudflare.start
  end
end
