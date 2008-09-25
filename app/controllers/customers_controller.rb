class CustomersController < ApplicationController
  unloadable
  layout 'base'
  before_filter :find_project, :authorize

  def index
    @customer = Customer.find_by_id(@project.customer_id)
  end
  
  def list
    @customers = Customer.find(:all)
  end

  def edit
    case request.method
    when :post
      @project.customer_id = params[:customer][:id]
      if @project.save
        flash[:notice] = l(:notice_successful_save)
        redirect_to :action => "index", :id => params[:id]
      else
        flash[:error] = l(:notice_unsuccessful_save)
      end
    when :get
      @customer = Customer.find_by_id(@project.customer_id)
    end
  end

  def edit_info
    case request.method
    when :post
      @customer = Customer.find_by_id(params[:customer][:id])
      if @customer.nil?
        # New record
        @customer = Customer.new(params[:customer])
      end
      if @customer.update_attributes(params[:customer])
        flash[:notice] = l(:notice_successful_save)
        redirect_to :action => "list", :id => params[:id]
      else
        flash[:error] = l(:notice_unsuccessful_save)
      end

    when :get
      @customer = Customer.find_by_id(params[:customer_id])
    end
  end
  
  private
  def find_project
    @project=Project.find(params[:id])
  end
end
