# Use rake db:migrate_plugins to migrate installed plugins
class AddSkypeContact < ActiveRecord::Migration
  def self.up
    add_column :customers, :skype_name, :string    
  end

  def self.down
    remove_column :customers, :skype_name
  end
end
