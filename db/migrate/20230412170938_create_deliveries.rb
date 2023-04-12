class CreateDeliveries < ActiveRecord::Migration[6.1]
  def change
    create_table :deliveries do |t|
      t.string :postcode
      t.string :address
      t.string :name
      t.integer :customer_id
      t.timestamps
    end
  end
end
