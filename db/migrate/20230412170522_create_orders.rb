class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.integer :customer_id
      t.integer :postage
      t.integer :payment_way
      t.integer :status, default: 0
      t.integer :amount
      t.string :postcode
      t.string :address
      t.string :name
      t.timestamps
    end
  end
end
