class Public::CartItemsController < ApplicationController

  before_action :authenticate_customer!

  def index
    @cart_items = current_customer.cart_items
  end

  def create
    @cart_item = current_customer.cart_items.new(cart_item_params)

    # 商品をカート内に入れた時の処理
    if current_customer.cart_items.find_by(menu_id: params[:cart_item][:menu_id]).present?
      cart_item = current_customer.cart_items.find_by(menu_id: params[:cart_item][:menu_id])
      cart_item.count += params[:cart_item][:count].to_i
      cart_item.save
      redirect_to cart_items_path
    # もしカート内に「同じ」商品がない場合は通常の保存処理
    elsif @cart_item.save
      redirect_to cart_items_path
    # 保存できなかった場合
    else
      render 'index'
    end

  end

  def update
    cart_item = CartItem.find(params[:id])
    cart_item.update(cart_item_params)
    redirect_to cart_items_path
  end

  # カート内の商品一つだけの削除
  def destroy
    cart_item = CartItem.find(params[:id])
    cart_item.destroy
    redirect_to request.referer
  end

  # カート内すべての商品の削除
  def destroy_all
    cart_items = CartItem.all
    CartItem.destroy_all
    redirect_to cart_items_path
  end



  private

  def cart_item_params
      params.require(:cart_item).permit(:menu_id, :price, :count)
  end

end
