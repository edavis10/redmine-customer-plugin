class CustomersController < ApplicationController
  unloadable
  layout 'base'
  before_filter :find_project, :authorize

  def index
    @customer = Customer.find_by_id(@project.customer_id)
  end

  def edit
    case request.method
    when :post
      # Will fill out later
      @project.customer_id = params[:customer][:id]
      if @project.save
        flash[:notice] = "Saved"
        redirect_to :action => "index", :id => params[:id]
      else
        flash[:notice] = "Could not save"
      end
    when :get
      @customer = Customer.find_by_id(@project.customer_id)
    end
  end
  
  private
  def find_project
    @project=Project.find(params[:id])
  end
end
