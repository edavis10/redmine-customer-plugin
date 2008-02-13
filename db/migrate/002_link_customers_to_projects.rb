# Use rake db:migrate_plugins to migrate installed plugins
class LinkCustomersToProjects < ActiveRecord::Migration
  def self.up
    add_column :projects, :customer_id, :integer    
  end

  def self.down
    remove_column :projects, :customer_id
  end
end
