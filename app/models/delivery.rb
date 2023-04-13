class Delivery < ApplicationRecord
  #アソシエーション
  belongs_to :customer
end
