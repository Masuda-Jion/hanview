class Public::ReviewsController < ApplicationController

  def new
  end

  def create
    menu = Menu.find(params[:review][:menu_id])
    @review = current_customer.reviews.new(review_params)
    @review.menu_id = menu.id
    if @review.save
      flash[:notice] = "You have created book successfully."
      redirect_to menu_path(menu)
    else
      flash[:notice] = "星の評価をしてください"
      redirect_to menu_path(menu)
    end
  end

  def index
  end

  def edit
  end

  def show
  end

  def destroy
    @review = Review.find(params[:id])
    menu = Menu.find(@review.menu_id)
    @review.destroy
    redirect_to menu_path(menu)
  end

  private

  def review_params
    params.require(:review).permit(:title, :star, :content, :menu_id)
  end

end
