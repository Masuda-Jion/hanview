class Review < ApplicationRecord

  #アソシエーション
  belongs_to :customer
  belongs_to :menu
  has_many :likes, dependent: :destroy

  #動画を投稿する機能
  has_one_attached :video

  #画像を投稿する機能
  has_one_attached :image

  def get_image(width, height)
    image.variant(resize_to_limit: [width, height]).processed
  end

  # 星の評価の空を禁止する、且つ1以上、5未満
  validates :star, numericality: {
    less_than_or_equal_to: 5,
    greater_than_or_equal_to: 1,
  }, presence: true

  #いいね機能
  def liked_by?(customer)
    likes.exists?(customer_id: customer.id)
  end

end
