class Post < ApplicationRecord
  belongs_to :user, optional: true
  has_many :likes, dependent: :destroy
  has_one_attached :image
  has_many :post_tag_relations
  has_many :tags, through: :post_tag_relations

  def self.search(search)
    if search != ""
      Post.where('content LIKE(?) or title LIKE(?)', "%#{search}%", "%#{search}%")
    else
      Post.all
    end
  end

end
