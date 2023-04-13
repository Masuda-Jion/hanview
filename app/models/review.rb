class Review < ApplicationRecord
  #アソシエーション
  belongs_to :customer
  belongs_to :menu
end
