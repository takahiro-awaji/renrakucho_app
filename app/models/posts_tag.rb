class PostsTag

  include ActiveModel::Model
  attr_accessor :title, :content, :name, :user_id

  with_options presence:true do
    validates :title
    validates :content
    validates :name
  end

  def save
    post = Post.create(title: title, content: content, user_id: user_id)
    tag = Tag.where(name: name).first_or_initialize
    tag.save

    PostTagRelation.create(post_id: post.id, tag_id: tag.id)
  end

end
