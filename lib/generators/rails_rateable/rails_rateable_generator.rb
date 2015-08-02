require 'rails/generators/migration'

class RailsRateableMigrationGenerator < Rails::Generator::Base
  include Rails::Generators::Migration
  def self.source_root
    @_rails_rateable_source_root ||= File.expand_path("../templates", __FILE__)
  end

  def self.next_migration_number(path)
    Time.now.utc.strftime("%Y%m%d%H%M%S")
  end

  def copy_migration_file
    migration_template 'migration.rb', 'db/migrate/rails_rateable_migration.rb'
  end
end
