class AddInTimelineToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :in_timeline, :boolean, :default => true
  end
end
