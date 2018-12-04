require 'jquery-rails'
require 'os'
require 'chartkick'
require 'groupdate'
require 'daemons'
require 'browser'
require 'crono'

module Uzebba
  class Engine < ::Rails::Engine
    isolate_namespace Uzebba
      
    initializer 'Uzebba precompile hook', group: :all do |app|
      app.config.assets.precompile += %w(
        uzebba/uzebba.js
        uzebba/uzebba.css
      )
     end
      
    
    if defined?(Rails::Server)
      ## CRONO Start Up    
      config.after_initialize do
        if OS.windows?
          system "echo *** CRONO STARTING IN NEW CMD. . . ***"    
          system 'start "uzebba19crono" /MIN bundle exec crono RAILS_ENV=development'
        else    
          system "bundle exec crono start RAILS_ENV=development"
        end    
      end 
      ## CRONO Terminate 
      if OS.windows?  
          def do_at_exit(str1)    
            at_exit { print str1 }
          end
          at_exit { system 'taskkill /FI "WindowTitle eq uzebba19crono*" /T /F' }
          do_at_exit("***CRONO TERMINATED: ") 
	  else	  
          at_exit { Dir.chdir Rails.root 
		  system 'rm tmp/pids/crono.pid' }		  
      end 
        
    end      
       
  end
end
