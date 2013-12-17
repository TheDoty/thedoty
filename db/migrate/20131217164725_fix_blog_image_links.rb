class FixBlogImageLinks < ActiveRecord::Migration
  def change
    for p in Post.all do
      p.body = p.body.gsub /\/photo\/(\d+)\/img.jpg/, '/photo/\1'
      p.save!
    end
  end
end
