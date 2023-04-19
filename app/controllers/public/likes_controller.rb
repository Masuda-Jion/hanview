class Public::LikesController < ApplicationController
  
  def create
    review = Review.find(params[:review_id])
    @like = current_customer.likes.new(review_id: review.id)
    @like.save
    render 'replace_btn'
  end

  def destroy
    review = Review.find(params[:review_id])
    @like = current_customer.likes.find_by(review_id: review.id)
    @like.destroy
    render 'replace_btn'
  end
  
end
