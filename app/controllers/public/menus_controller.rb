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
    @reviews = Review.new
  end
  
  def genre_search
    @genre = Genre.find(params[:id])
    @menus = @genre.menus.all.page(params[:page]).per(8)
    @genres = Genre.all
  end

end
