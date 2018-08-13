require 'rails/generators'
require 'rails/generators/migration'
require 'rails/generators/active_record'

module Uzebba
  module Generators
    # rails generate uzebba:install
    class InstallGenerator < ::Rails::Generators::Base
      include Rails::Generators::Migration

      def self.next_migration_number(path)
        ActiveRecord::Generators::Base.next_migration_number(path)
      end

      desc 'Installs crono and generates the necessary configuration files'
      source_root File.expand_path('../templates', __FILE__)
        
      def create_migrations1
        migration_template 'migrate/create_uzebba_terminals.rb',
                           'db/migrate/create_uzebba_terminals.rb',
                           migration_version: migration_version
      end    
        
      def create_migrations2
        migration_template 'migrate/create_crono_jobs.rb',
                           'db/migrate/create_crono_jobs.rb',
                           migration_version: migration_version
      end         

      def copy_config
        template 'cronotab.rb', 'config/cronotab.rb'
      end       

      def rails5?
        Rails.version.start_with? '5'
      end

      def migration_version
        if rails5?
          "[#{Rails::VERSION::MAJOR}.#{Rails::VERSION::MINOR}]"
        end
      end
    end
  end
end