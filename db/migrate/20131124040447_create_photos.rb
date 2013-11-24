class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.string :photo
      t.string :alt      
      t.text :description

      t.timestamps
    end
  end
end
