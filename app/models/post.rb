class Post < ApplicationRecord
  belongs_to :user
  validates :user_id, presence: true
  validates :content, presence: true, length: { maximum:250 }
  validates :photo, presence: true
  has_many :cafe_images, dependent: :destroy
  accepts_nested_attributes_for :cafe_images, allow_destroy: true

  has_many :comments

  has_many :favorites, dependent: :destroy
  has_many :favorite_users, through: :favorites, source: :user

  def like(user)
    favorites.create(user_id: user.id)
  end

  def unlike(user)
    favorites.find_by(user_id: user.id).destroy
  end

  def like?(user)
    favorite_users.include?(user)
  end
end
