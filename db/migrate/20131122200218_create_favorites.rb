class CreateFavorites < ActiveRecord::Migration
  def change
    create_table :favorites do |t|
      t.string :friendly
      t.string :name
      t.text :description
      t.string :address
      t.boolean :has_food
      t.boolean :has_coffee
      t.boolean :has_drinks

      t.timestamps
    end
  end
end
