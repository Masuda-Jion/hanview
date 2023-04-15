class Admin::HomesController < ApplicationController

  before_action :authenticate_admin!

  def top
    @orders = Order.all.page(params[:page]).per(5)
    @order_details = OrderDetail.all
  end

end
