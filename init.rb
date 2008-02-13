# Redmine customer plugin
require 'redmine'

RAILS_DEFAULT_LOGGER.info 'Starting Customer plugin for RedMine'

Redmine::Plugin.register :customer do
  name 'Customer plugin'
  author 'Eric Davis'
  description 'This is a plugin for Redmine that can be used to track basic customer information'
  version '0.1.0'
  
  project_module :customer_module do
    permission :index, {:customers => [:index]}, :public => true
    permission :edit, {:customers => [:edit]}, :public => true
  end

  menu :project_menu, "Customer", :controller => 'customers', :action => 'index'
end
