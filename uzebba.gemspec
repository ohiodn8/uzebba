$:.push File.expand_path("lib", __dir__)

# Maintain your gem's version:
require "uzebba/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "uzebba"
  s.version     = Uzebba::VERSION
  s.authors     = ["odion ohio"]
  s.email       = ["ohiodn8@gmail.com"]
  s.homepage    = "http://github.com/ohiodn8/uzebba"
  s.summary     = "Simple rails 5 monitoring tool"
  s.description = "rails 5 application monitoring tool to check for System Information, CPU Usage and Memory Usage of server/machine."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  # s.add_dependency "rails", "~> 5.2.1" 
  s.add_dependency "jquery-rails"    
  s.add_dependency "os"
  s.add_dependency "chartkick"   
  s.add_dependency "groupdate"
  s.add_dependency "daemons" 
  s.add_dependency "browser"
  s.add_dependency "crono", "~> 1.1", ">= 1.1.2"  
  
  # s.add_development_dependency "sqlite3"   
end
