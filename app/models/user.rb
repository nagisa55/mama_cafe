class User < ApplicationRecord
  validates :family_name, presence: true, length: { maximum: 10 }
  validates :first_name, presence: true, length: { maximum: 10 }
  validates :username, presence: true, length: { maximum: 10 }
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i },
                    uniqueness: { case_sensitive: false }
  validates :profile, length: { maximum: 250 }
  mount_uploader :image, ImageUploader
  has_secure_password

  has_many :posts
  has_many :comments
end
