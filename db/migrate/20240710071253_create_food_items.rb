class CreateFoodItems < ActiveRecord::Migration[7.1]
  def change
    create_table :food_items do |t|
      t.string :category
      t.integer :price
      t.string :name
      t.string :flavor
      t.integer :stock
      t.references :truck, null: false, foreign_key: true

      t.timestamps
    end
  end
end
