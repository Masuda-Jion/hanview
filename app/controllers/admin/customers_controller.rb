class Admin::CustomersController < ApplicationController
  
  before_action :authenticate_admin!
  
  def index
    @customers = Customer.all.page(params[:page]).per(5)
  end

  def show
    @customers = Customer.all
    @customer = Customer.find(params[:id])
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def update
    @customer = Customer.find(params[:id])
  
    if @customer.update(customer_params)
      flash[:notice] = "変更を保存しました"
      redirect_to admin_customer_path(@customer.id)
    else
      render :edit
    end
  
  end

  private

  def customer_params
    params.require(:customer).permit(:first_name, :last_name, :first_name_kana, :last_name_kana,
     :postcode, :address, :telephone_number, :email, :is_delete)
  end

end
