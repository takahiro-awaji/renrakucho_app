class Post < ApplicationRecord
  belongs_to :user, optional: true
  has_many :likes, dependent: :destroy
  has_one_attached :image
  has_many :post_tag_relations, dependent: :destroy
  has_many :tags, through: :post_tag_relations

  def self.search(search)
    if search != ""
      Post.where('content LIKE(?) or title LIKE(?)', "%#{search}%", "%#{search}%").order(created_at: :desc)
    else
      Post.all.order(created_at: :desc)
    end
  end

end
