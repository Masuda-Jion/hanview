class CreateMenus < ActiveRecord::Migration[6.1]
  def change
    create_table :menus do |t|
      t.integer :genre_id
      t.string :name
      t.text :info
      t.integer :non_tax_price
      t.boolean :is_sale
      t.timestamps
    end
  end
end
