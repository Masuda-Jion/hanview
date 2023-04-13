class Genre < ApplicationRecord
  #アソシエーション
  has_many :name, presence: true
end
