class Like < ApplicationRecord
  #アソシエーション
  belongs_to :customer
  belongs_to :review
end
