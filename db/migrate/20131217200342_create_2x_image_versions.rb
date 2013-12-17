class Create2xImageVersions < ActiveRecord::Migration
  def change
    for p in Photo.all do
      p.photo.recreate_versions!
      p.save!
    end
  end
end
