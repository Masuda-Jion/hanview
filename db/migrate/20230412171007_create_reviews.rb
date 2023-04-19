class CreateReviews < ActiveRecord::Migration[6.1]
  def change
    create_table :reviews do |t|
      t.integer :customer_id
      t.integer :menu_id
      t.string :title
      t.string :star
      t.text :content
      t.string :vide
      t.timestamps
    end
  end
end
