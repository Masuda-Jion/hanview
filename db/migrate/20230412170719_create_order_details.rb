class CreateOrderDetails < ActiveRecord::Migration[6.1]
  def change
    create_table :order_details do |t|
      t.integer :order_id
      t.integer :menu_id
      t.integer :tax_in_price
      t.integer :make_status
      t.integer :count
      t.timestamps
    end
  end
end
