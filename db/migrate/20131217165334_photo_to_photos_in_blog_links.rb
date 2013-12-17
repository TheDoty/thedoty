class PhotoToPhotosInBlogLinks < ActiveRecord::Migration
  def change
    for p in Post.all do
      p.body = p.body.gsub /\/photo\/(\d+")/, '/photos/\1'
      p.save!
    end
  end
end
