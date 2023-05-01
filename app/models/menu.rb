class Menu < ApplicationRecord

  # アソシエーション
  has_many :cart_items , dependent: :destroy
  has_many :order_details
  has_many :reviews , dependent: :destroy
  belongs_to :genre

  # バリデーション
  validates :image, presence: true
  validates :name, presence: true
  validates :info, presence: true
  validates :non_tax_price, presence: true
  validates :genre_id, presence: true
  validates :is_sale, inclusion: {in: [true, false]}

  #menuの検索分岐
  def self.looks(search, word)

    if search == "perfect_match"
      @menu = Menu.where("name LIKE?","#{word}")
    elsif search == "forward_match"
      @menu = Menu.where("name LIKE?","#{word}%")
    elsif search == "backward_match"
      @menu = Menu.where("name LIKE?","%#{word}")
    elsif search == "partial_match"
      @menu = Menu.where("name LIKE?","%#{word}%")
    else
      @menu = Menu.all
    end

  end

  # 商品の画像
  has_one_attached :image

  def get_image(width, height)

    unless image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      image.attach(io: File.open(file_path), filename: "default-image.jpg", content_type: "image/jpeg")
    end

    image.variant( resize: "140" )
  end

  # 税込価格
  def tax_in_price
     (self.non_tax_price * 1.1).round
  end

end
