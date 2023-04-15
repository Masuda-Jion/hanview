class Public::OrdersController < ApplicationController
  
  def new
    @customer = current_customer
    @order = Order.new
  end

  def check
    @order = Order.new(order_params)
    @order.payment_way = params[:order][:payment_way]  #支払方法取得

    if params[:order][:address_select] == "1"
      @order.name = current_customer.first_name
      @order.address = current_customer.address
      @order.postcode = current_customer.postcode
    
    elsif params[:order][:address_select] == "2"
      
      @delivery = Delivery.find(params[:order][:delivery_id])
      
      if @delivery
        @order.name = @delivery.name
        @order.address = @delivery.address
        @order.postcode = @delivery.postcode
      end
      
      @payment_way = @order.payment_way
      @postcode = @order.postcode
      @address = @order.address
   
    elsif params[:order][:address_select] == "3"
   
    else
      redirect_to request.referer
    end
    
    @cart_items = current_customer.cart_items.all  #カートアイテムの情報 ユーザー確認用
    @total_price =  @cart_items.sum(&:subtotal_price)  #合計金額
    @postage = 800  #送料
  end


  def create
    cart_items = current_customer.cart_items.all
    # ログインユーザーのカート内商品をすべて取り出す
    @order = current_customer.orders.new(order_params)

    if @order.save
      
      cart_items.each do |cart_item|
        order_detail = OrderDetail.new
        order_detail.menu_id = cart_item.menu_id
        order_detail.order_id = @order.id
        order_detail.count = cart_item.count
        order_detail.tax_in_price = cart_item.menu.tax_in_price
        order_detail.save
      end
      
      redirect_to orders_done_path
      cart_items.destroy_all
    
    else
      @customer = current_customer
      @order = Order.new
      render :new
    end
     
  end

  def index
    if current_customer
      @orders = current_customer.orders
    end
  end

  def show
    if current_customer
      @orders = current_customer.orders
    end
    
    @order = Order.find(params[:id])
    @postage = 800  #送料
  end



  private

  def order_params
    params.require(:order).permit(:payment_way, :postcode, :address, :name, :amount, :customer_id, :postage, :status)
  end
  
end
