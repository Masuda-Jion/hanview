class Public::MenusController < ApplicationController

  def index
    @menus = Menu.page(params[:page]).per(8)
    @genres = Genre.all
  end

  def show
    @menu = Menu.find(params[:id])
    @genres = Genre.all
    @count = params[:count] || 1
    @cart_item = CartItem
  end

end
