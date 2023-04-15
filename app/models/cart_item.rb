class CartItem < ApplicationRecord
  
  #アソシエーション
  belongs_to :customer
  belongs_to :menu

  # 小計計算
  def subtotal_price
    menu.tax_in_price * (self.count || 0)
  end
  
end
