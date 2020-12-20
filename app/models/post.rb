class Post < ApplicationRecord
  has_many :post_users
  has_many :users, through: :post_users
  has_many :messages

  validates :name, presence: true

  def self.search(search)
    if search != ""
      Post.where('name LIKE(?)', "%#{search}%").includes(:post_users).order('created_at DESC')
    else
      Post.all
    end
  end
end
