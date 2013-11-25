class AddFriendlyToPost < ActiveRecord::Migration
  def change
    add_column :posts, :friendly, :string
  end
end
