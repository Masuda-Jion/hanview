class Public::ReviewsController < ApplicationController

  def new
  end

  def create
    menu = Menu.find(params[:review][:menu_id])
    @review = current_customer.reviews.new(review_params)
    @review.menu_id = menu.id
    
    # レビュー投稿時の処理
    if @review.save
      flash[:notice] = "レビューを投稿しました"
      redirect_to menu_path(menu)
    else
      flash[:notice] = "星の評価をしてください"
      redirect_to menu_path(menu)
    end
  end

  def index
  end

  def edit
    @review = Review.find(params[:id])
  end
  
  def update
    @review = Review.find(params[:id])
    
    # レビュー内容の編集時の処理
    if @review.update(review_params)
      flash[:notice] = "変更を保存しました"
      redirect_to review_path(@review.id)
    else
      render :show
    end
    
  end

  def show
    @review = Review.find(params[:id])
  end

  def destroy
    @review = Review.find(params[:id])
    menu = Menu.find(@review.menu_id)
    @review.destroy
    redirect_to menu_path(menu)
  end

  private

  def review_params
    params.require(:review).permit(:title, :video, :star, :content, :menu_id, :image)
  end

end
