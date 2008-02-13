# Redmine empty plugin
require 'redmine'

RAILS_DEFAULT_LOGGER.info 'Starting EMPTY plugin for RedMine'

Redmine::Plugin.register :empty do
  name 'Empty plugin'
  author 'Author name'
  description 'This is an empty plugin for Redmine'
  version '0.0.0'
end
