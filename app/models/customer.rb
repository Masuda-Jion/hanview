class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  #アソシエーション
  has_many :orders
  has_many :cart_items , dependent: :destroy
  has_many :deliveries , dependent: :destroy
  has_many :follower, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy
  has_many :followed, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy
  has_many :following_customer, through: :follower, source: :followed
  has_many :follower_customer, through: :followed, source: :follower
  has_many :reviews , dependent: :destroy
  has_many :likes , dependent: :destroy

  #バリデーション
  validates :first_name, presence: true
  validates :first_name_kana, presence: true
  validates :last_name, presence: true
  validates :last_name_kana, presence: true
  validates :postcode, presence: true
  validates :address, presence: true
  validates :telephone_number, presence: true

  # ユーザーをフォローする
  def follow(customer_id)
    follower.create(followed_id: customer_id)
  end

  # ユーザーのフォローを外す
  def unfollow(customer_id)
    follower.find_by(followed_id: customer_id).destroy
  end

  # フォローしていればtrueを返す
  def following?(customer)
    following_customer.include?(customer)
  end

  # 退会ステータスがfalseの時にtrueを返す
  def active_for_authentication?
    super && (is_delete == false)
  end

  # ゲストログイン
  def self.guest
    find_or_create_by!(email: 'guest@example.com') do |customer|
      customer.password = SecureRandom.urlsafe_base64
      customer.first_name_kana = "ゲスト"
      customer.last_name_kana = "1"
      customer.first_name = "guest"
      customer.last_name = "1"
      customer.postcode = "1111111"
      customer.address = "guest"
      customer.telephone_number = "1111111"
    end
  end

end
