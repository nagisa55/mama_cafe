class Post < ApplicationRecord
  belongs_to :user
  validates :user_id, presence: true
  validates :content, presence: true, length: { maximum:250 }
  validates :photo, presence: true
  mount_uploader :photo, PhotoUploader

  has_many :comments
end
