class Post < ApplicationRecord
  belongs_to :user, optional: true
  has_many :likes, dependent: :destroy
  has_one_attached :image

  def self.search(search)
    if search != ""
      Post.where('content LIKE(?)', "%#{search}%")
      Post.where('title LIKE(?)', "%#{search}%")
    else
      Post.all
    end
  end

end
