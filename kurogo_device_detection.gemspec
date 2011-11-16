# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "kurogo_device_detection/version"

Gem::Specification.new do |s|
  s.name        = "kurogo_device_detection"
  s.version     = KurogoDeviceDetection::VERSION
  s.authors     = ["Bryan Shelton"]
  s.email       = ["bryan@sheltonopensolutions.com"]
  s.homepage    = ""
  s.summary     = %q{Kurogo remote device detection}
  s.description = %q{Kurogo remote device detection}

  s.rubyforge_project = "kurogo_device_detection"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  # specify any dependencies here; for example:
  # s.add_development_dependency "rspec"
  # s.add_runtime_dependency "rest-client"
end
