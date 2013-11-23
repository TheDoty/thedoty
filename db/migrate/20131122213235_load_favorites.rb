class LoadFavorites < ActiveRecord::Migration
  def self.up
    load_data :favorites
  end

  def self.down
    execute "DELETE FROM favorites"
  end
end
