require "proxly/version"
require "proxly/railtie"
require "proxly/tag_helper"

module Proxly
  # Your code goes here...
  mattr_accessor :proxy_host
  mattr_accessor :proxy_protocol, default: "https"
end
