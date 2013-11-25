class Post < ActiveRecord::Base
  def self.author(title, body)
    friendly = title.parameterize.underscore
    body = body.gsub /photo:([0-9]*)[^0-9]?/, '</p><p><a href="/photo/\1/img.jpg"><img src="/photo/\1/detail_img.jpg"></a></p><p>'
    body = "<p>#{body}</p>".gsub /<p>\s*<\/p>/, ''
    post = Post.new(title: title, friendly: friendly, body: body)
    post.save!
  end
end
