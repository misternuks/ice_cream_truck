class RemoveFlavorFromFoodItem < ActiveRecord::Migration[7.1]
  def change
    remove_column :food_items, :flavor, :string
  end
end
