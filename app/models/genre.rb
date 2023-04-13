class Genre < ApplicationRecord
  #アソシエーション
  has_many :menus

  #バリデーション
  validates :name, presence: true
end
