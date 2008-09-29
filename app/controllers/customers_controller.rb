class CustomersController < ApplicationController
  unloadable
  layout 'base'
  before_filter :find_project, :authorize
  before_filter :find_customer, :only => [:edit, :update, :destroy]
  before_filter :find_customers, :only => [:list, :select]
 
  def show
    @customer = Customer.find_by_id(@project.customer_id)
  end
  
  def list
    #@customers = Customer.find(:all)
  end

  def select
    #@customers = Customer.find(:all)
  end
  
  def assign
    @project.customer_id = params[:customer][:id]
    if @project.save
      flash[:notice] = l(:notice_successful_save)
      redirect_to :action => "show", :id => params[:id]
    else
      flash[:notice] = l(:notice_unsuccessful_save)
      redirect_to :action => "select", :id => params[:id]
    end
  end
    
  def edit
    #@customer = Customer.find_by_id(params[:customer_id])
  end

  def update
    #@customer = Customer.find_by_id(params[:customer_id])
    if @customer.update_attributes(params[:customer])
      flash[:notice] = l(:notice_successful_update)
      redirect_to :action => "list", :id => params[:id]
    else
      render :action => "edit", :id => params[:id]
    end
  end

  def destroy
    #@customer = Customer.find_by_id(params[:customer_id])
    if @customer.destroy
      flash[:notice] = l(:notice_successful_delete)
    else
      flash[:error] = l(:notice_unsuccessful_save)
    end
    redirect_to :action => "list", :id => params[:id]
  end
  
  def new
    @customer = Customer.new
  end

  def create
    @customer = Customer.new(params[:customer])
    if @customer.save
      flash[:notice] = l(:notice_successful_create)
      redirect_to :action => "select", :id => params[:id]
    else
      render :action => "new", :id => params[:id]
    end
  end
  
  private
  
  def find_project
    @project = Project.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    render_404
  end

  def find_customer
    @customer = Customer.find_by_id(params[:customer_id])
  rescue ActiveRecord::RecordNotFound
    render_404
  end
  
  def find_customers
    @customers = Customer.find(:all) || []
  end

end
