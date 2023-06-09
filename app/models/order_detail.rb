class OrderDetail < ApplicationRecord
  #アソシエーション
  belongs_to :order
  belongs_to :menu
  
  #製作ステータス
  enum make_status: {着手不可:0, 製作待ち:1, 製作中:2, 製作完了:3}
end
