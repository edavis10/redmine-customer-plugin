require File.dirname(__FILE__) + '/../spec_helper'

describe Customer do
  before(:each) do
    @customer = Customer.new
  end
  
  it 'should not be valid without a name or company' do
    @customer.should_not be_valid
  end
  
  it 'should require a name if company is not set' do
    @customer.should_not be_valid
    @customer.errors.on(:name).should_not be_empty
  end

  it 'should require a company if name is not set' do
    @customer.should_not be_valid
    @customer.errors.on(:company).should_not be_empty
  end
  
  it 'should be valid if name is set but company is missing' do
    @customer.name = "John Customer"
    @customer.should be_valid
  end

  it 'should be valid if company is set but name is missing' do
    @customer.company = "ABC Company"
    @customer.should be_valid
  end

  it '#name should be unique within a company' do
    @customer.name = 'John Customer'
    @customer.company = "ABC Company"
    @customer.save!
    
    @conflict_customer = Customer.new( :name => 'John Customer', :company => "ABC Company")
    @conflict_customer.should_not be_valid
    @conflict_customer.errors.on(:name).should_not be_empty
  end
  
  describe 'with an invalid email' do
    before(:each) do
      @customer.attributes = { :name => 'John Customer', :company => "ABC Company"}
    end
    
    it 'would have more than one @' do
      @customer.email = "john@ABC@com"
      @customer.should_not be_valid
    end

    it 'would have no characters before @' do
      @customer.email = "@com"
      @customer.should_not be_valid
    end

    it 'would have no characters after @' do
      @customer.email = "john@"
      @customer.should_not be_valid
    end

    it 'would have non-alphanumerics for the domain' do
      @customer.email = "john@ABC,DEF.com"
      @customer.should_not be_valid
    end

    it 'should have a TLD at least 2 characters long' do
      @customer.email = "john@ABC.c"
      @customer.should_not be_valid
    end

  end
  
  describe 'with a valid email' do
    it 'can be blank' do
      @customer.attributes = { :name => 'John Customer', :company => "ABC Company"}
      @customer.email = ""
      @customer.should be_valid
    end
    
    it 'can be nil' do
      @customer.attributes = { :name => 'John Customer', :company => "ABC Company"}
      @customer.email = nil
      @customer.should be_valid
    end
    
    it 'should allow subdomains' do
      @customer.attributes = { :name => 'John Customer', :company => "ABC Company"}
      @customer.email = "john@sales.abc.com"
      @customer.should be_valid
    end
    
    it 'should allow a TLD with at least 2 characters' do
      @customer.attributes = { :name => 'John Customer', :company => "ABC Company"}
      @customer.email = "john@abc.us"
      @customer.should be_valid
    end
  end
  
end

describe Customer do
  it 'should have many projects' do
    association = Customer.reflect_on_association(:projects)
    association.should_not be_nil
    association.name.should eql(:projects)
    association.macro.should eql(:has_many)
  end
end

describe Customer, '.pretty_name' do
  it 'should return the name of the Customer' do
    @customer = Customer.new( :name => 'John Customer')
    @customer.pretty_name.should eql('John Customer')
  end

  it 'should add the company to the name if company is present' do
    @customer = Customer.new( :name => 'John Customer', :company => 'ABC Company')
    @customer.pretty_name.should match(/ABC Company/)
  end
  
  it 'should return only the company name if name is missing' do
    @customer = Customer.new( :company => 'ABC Company')
    @customer.pretty_name.should match(/ABC Company/)
  end
  
  it 'should separate the customer name from the company name by a space and comma if both are present' do
    @customer = Customer.new( :name => 'John Customer', :company => 'ABC Company')
    @customer.pretty_name.should eql("John Customer, ABC Company")
  end
end
