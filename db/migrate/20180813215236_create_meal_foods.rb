class CreateMealFoods < ActiveRecord::Migration[5.2]
  def change
    create_table :meal_foods do |t|
      t.references :meals, index: true, foreign_key: true
      t.references :foods, index: true, foreign_key: true
    end
  end
end
