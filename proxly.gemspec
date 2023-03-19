require_relative "lib/proxly/version"

Gem::Specification.new do |spec|
  spec.name = "proxly"
  spec.version = Proxly::VERSION
  spec.authors = ["Mason Stallmo"]
  spec.email = ["masonstallmo@hey.com"]
  spec.homepage = "https://github.com/mstallmo/proxly"
  spec.summary =
    "Serve your JS and CSS from a local server over a proxied connection"
  spec.description =
    "Easily serve JS and CSS using javascript_link_tag and stylesheet_link_tag over a ngrok proxy or Cloudflare tunnel"
  spec.license = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the "allowed_push_host"
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  # spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/mstallmo/proxly"
  spec.metadata[
    "changelog_uri"
  ] = "https://github.com/mstallmo/proxly/blob/main/CHANGELOG.md"

  spec.files =
    Dir.chdir(File.expand_path(__dir__)) do
      Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]
    end

  spec.add_dependency "rails", ">= 7.0.3"

  spec.add_development_dependency "rspec-rails", "~> 6.0", ">= 6.0.1"
  spec.add_development_dependency "standard"
  spec.add_development_dependency "rubocop-rails"
  spec.add_development_dependency "rubocop-rspec"
  spec.add_development_dependency "rubocop-config-prettier"
end
