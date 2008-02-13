class Customer < ActiveRecord::Base
  has_many :projects
end
