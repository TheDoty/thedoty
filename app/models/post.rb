class Post < ActiveRecord::Base
  self.per_page = 5

  def for_json
    {
      friendly: self.friendly,
      title: self.title,
      created_at: self.created_at.strftime("%B %d, %Y"),
      body: self.body.html_safe
    }
  end

  def self.author(title, body, created_at = nil)
    friendly = title.parameterize.underscore
    body = body.gsub /photo:([0-9]*)[^0-9]?/, '</p><p><div class="photo"><a href="/photos/\1"><img src="/photo/\1/img_detail.jpg"></a></div></p><p>'
    body = "<p>#{body}</p>".gsub /<p>\s*<\/p>/, ''

    post = Post.new(title: title, friendly: friendly, body: body)

    if post.save
      if created_at
        post.created_at = created_at
        post.save!
      end

      return post
    end

    return nil
  end
end
