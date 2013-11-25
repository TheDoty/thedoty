class Post < ActiveRecord::Base
  self.per_page = 5

  def self.author(title, body, created_at = nil)
    friendly = title.parameterize.underscore
    body = body.gsub /photo:([0-9]*)[^0-9]?/, '</p><p><div class="photo"><a href="/photo/\1/img.jpg"><img src="/photo/\1/detail_img.jpg"></a></div></p><p>'
    body = "<p>#{body}</p>".gsub /<p>\s*<\/p>/, ''

    post = Post.new(title: title, friendly: friendly, body: body)
    post.save!

    if created_at
      post.created_at = created_at
      post.save!
    end
  end
end
