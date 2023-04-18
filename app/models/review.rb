class Review < ApplicationRecord

  #アソシエーション
  belongs_to :customer
  belongs_to :menu
  
  #動画を投稿する機能
  has_one_attached :video

  # 星の評価の空を禁止する、且つ1以上、5未満
  validates :star, numericality: {
    less_than_or_equal_to: 5,
    greater_than_or_equal_to: 1,
  }, presence: true

end
