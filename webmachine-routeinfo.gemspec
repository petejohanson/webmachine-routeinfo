$:.push File.expand_path("../lib", __FILE__)
require 'webmachine-routeinfo/version'

Gem::Specification.new do |gem|
  gem.name = "webmachine-routeinfo"
  gem.version = Webmachine::RouteInfo::VERSION
  gem.summary = %Q{webmachine-routeinfo provides a webmachine-ruby resource for inspecting route information}
  gem.description = <<-DESC.gsub(/\s+/, ' ')
    webmachine-routeinfo provides a webmachine-ruby resource for inspecting route information
  DESC
  gem.homepage = "http://github.com/petejohanson/webmachine-routeinfo"
  gem.authors = ["Pete Johanson"]
  gem.email = ["peter@peterjohanson.com"]

  gem.add_runtime_dependency(%q<webmachine>, [">= 1.0.0"])
  gem.add_development_dependency(%q<rspec>, ["~> 2.8.0"])
  gem.add_development_dependency(%q<rake>)

  ignores = File.read(".gitignore").split(/\r?\n/).reject{ |f| f =~ /^(#.+|\s*)$/ }.map {|f| Dir[f] }.flatten
  gem.files = (Dir['**/*','.gitignore'] - ignores).reject {|f| !File.file?(f) }
  gem.test_files = (Dir['spec/**/*','features/**/*','.gitignore'] - ignores).reject {|f| !File.file?(f) }
  gem.require_paths = ['lib']
end

