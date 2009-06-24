class TextElementsMigrationGenerator < Rails::Generator::Base

  def manifest
    record do |m|
      m.migration_template "migration.rb",
                           'db/migrate',
                           :migration_file_name => "create_text_elements"
    end
  end
  
end