class Delivery < ApplicationRecord
  # アソシエーション
  belongs_to :customer

  # 配送先のセレクトボックスを作るための記述
  def address_display
    '〒' + postcode + ' ' + address + ' ' + name
  end
end
