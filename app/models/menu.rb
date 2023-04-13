class Menu < ApplicationRecord
  #アソシエーション
  has_many :cart_items , dependent: :destroy
  has_many :order_details
  has_many :reviews , dependent: :destroy
  belongs_to :genre
end
