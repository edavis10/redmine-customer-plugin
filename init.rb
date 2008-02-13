# Redmine customer plugin
require 'redmine'

RAILS_DEFAULT_LOGGER.info 'Starting Customer plugin for RedMine'

Redmine::Plugin.register :customer do
  name 'Customer plugin'
  author 'Eric Davis'
  description 'This is a plugin for Redmine that can be used to track basic customer information'
  version '0.1.0'
end
