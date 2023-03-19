require "proxly/version"
require "proxly/railtie"
require "proxly/tag_helper"

module Proxly
  mattr_accessor :proxy_host
  mattr_accessor :proxy_protocol, default: "https"

  def self.setup
    yield self
  end
end
