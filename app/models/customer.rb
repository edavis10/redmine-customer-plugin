class Customer < ActiveRecord::Base
  has_many :projects
  
  def pretty_name
    result = name || "[#{company}]" 
    result << " [#{company}]" unless company.blank?
  end
end
