# Redmine Customer plugin

This is a plugin for Redmine that can be used to track basic customer information for each project.  It was created so I could track which project belonged to which customer.

## Features

* Store Customer data
* Associate a Customer for each project
* Permissions to control user access to data

## Install

1. Download the archive file and extract it to your `vendor/plugins` folder.  You can also download directly from GitHub using git:

         git clone git://github.com/edavis10/redmine-customer-plugin.git vendor/plugins/customer_plugin

2. Follow the Redmine plugin installation steps at: http://www.redmine.org/wiki/redmine/Plugins  Make sure to install Engines 2 if you use Rails 2.0.
3. Setup the database using the migrations.

         rake db:migrate_plugins

4. Login to your Redmine install as an Administrator
5. Setup the permissions for your roles
6. Add the "Customer module" to the enabled modules for your project
7. The link to the plugin should appear on that project's navigation as Customer

## Usage

1. Use the "New" link to create a Customer.
2. Once you have created a customer, use the "Assign" link to assign a customer to a Project.
3. Continue doing steps #1 and #2 until you have assigned customers to all your projects you need.

## Upgrade

### Zip file

1. Download the latest zip file from https://projects.littlestreamsoftware.com
2. Unzip the file to your Redmine into vendor/plugins
3. Restart your Redmine

### Git

1. Open a shell to your Redmine's vendor/plugins/customer_plugin folder
2. Update your git copy with `git pull`
3. Restart your Redmine

## License

This plugin is licensed under the GNU GPL v2.  See LICENSE.txt and GPL.txt for details.

## Project help

If you need help you can contact the maintainer at his email address (See CREDITS.txt) or create an issue in the Bug Tracker.

### Bug tracker

If you would like to report a bug or request a new feature the bug tracker is located at:

   https://projects.littlestreamsoftware.com

