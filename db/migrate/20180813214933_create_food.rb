class CreateFood < ActiveRecord::Migration[5.2]
  def change
    create_table :foods do |t|
      t.string :name
      t.integer :calories

      t.timestamps
    end
  end
end
