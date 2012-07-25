require 'rubygems'
require 'rubygems/package_task'

def gemspec
  $webmachine_routeinfo_gemspec ||= Gem::Specification.load("webmachine-routeinfo.gemspec")
end

Gem::PackageTask.new(gemspec) do |pkg|
  pkg.need_zip = false
  pkg.need_tar = false
end

task :gem => :gemspec

desc %{Validate the gemspec file.}
task :gemspec do
  gemspec.validate
end

desc %{Release the gem to RubyGems.org}
task :release => :gem do
  system "gem push pkg/#{gemspec.name}-#{gemspec.version}.gem"
end

require 'rspec/core'
require 'rspec/core/rake_task'

desc "Run specs"
RSpec::Core::RakeTask.new(:spec)

task :default => :spec
