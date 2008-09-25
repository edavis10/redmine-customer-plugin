# Redmine customer plugin
require 'redmine'

RAILS_DEFAULT_LOGGER.info 'Starting Customer plugin for RedMine'

Redmine::Plugin.register :customer_plugin do
  name 'Customer plugin'
  author 'Eric Davis'
  description 'This is a plugin for Redmine that can be used to track basic customer information'
  version '0.1.0'
  
  project_module :customer_module do
    permission :view_customer, {:customers => [:index]}
    permission :assign_customer, {:customers => [:edit]}
    permission :see_customer_list, {:customers => [:list]}
    permission :edit_customer, {:customers => [:edit_info]}
  end

  menu :project_menu, :customers, {:controller => 'customers', :action => 'index'}, :caption => :customer_title
end
