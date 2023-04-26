class Admin::ReviewsController < ApplicationController

  def index
    @review = Review.find(params[:id])
  end

  def show
    @review = Review.find(params[:id])
  end

  def destroy
    @review = Review.find(params[:id])
    menu = Menu.find(@review.menu_id)
    @review.destroy
    redirect_to admin_menu_path(menu)
  end

end
