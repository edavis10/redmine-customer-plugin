class Customer < ActiveRecord::Base
  has_many :projects
  
  # name or company is mandatory
  validates_presence_of :name, :if => :company_unsetted
  validates_presence_of :company, :if => :name_unsetted
  
  def pretty_name
    result = name.strip
    result << " " unless result.blank?
    result << "[#{company}]" unless company.blank?
    result
  end
  
  private
  
  def name_unsetted
    self.name.blank?
  end
  
  def company_unsetted
    self.company.blank?
  end

end
