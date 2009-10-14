# Redmine customer plugin
require 'redmine'

RAILS_DEFAULT_LOGGER.info 'Starting Customer plugin for RedMine'

Redmine::Plugin.register :customer_plugin do
  name 'Customer plugin'
  author 'Eric Davis'
  description 'This is a plugin for Redmine that can be used to track basic customer information'
  version '0.2.0'

  url 'https://projects.littlestreamsoftware.com/projects/redmine-customers' if respond_to? :url
  author_url 'http://www.littlestreamsoftware.com' if respond_to? :author_url

  
  project_module :customer_module do
    permission :view_customer, {:customers => [:show]}
    permission :assign_customer, {:customers => [:assign, :select]}
    permission :see_customer_list, {:customers => [:list]}
    permission :edit_customer, {:customers => [:edit, :update, :new, :create, :destroy]}
  end

  menu :project_menu, :customers, {:controller => 'customers', :action => 'show'}, :caption => :customer_title
end
