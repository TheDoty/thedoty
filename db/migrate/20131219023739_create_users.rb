class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :hash_provider
      t.string :hash_uid
      t.text :name, default: 'Stranger'
      t.boolean :is_admin, default: false
      t.timestamps
    end
  end
end
