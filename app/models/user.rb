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

  has_many :relationships
  has_many :followings, through: :relationships, source: :follow
  has_many :reverse_of_relationship, class_name: "Relationship", foreign_key: "follow_id"
  has_many :followers, through: :reverse_of_relationship, source: :user
  has_many :favorites, dependent: :destroy

  def follow(other_user)
    unless self == other_user
      self.relationships.find_or_create_by(follow_id: other_user.id)
    end
  end

  def unfollow(other_user)
		relationship = self.relationships.find_by(follow_id: other_user.id)
		relationship.destroy if relationship
	end

	def following?(other_user)
		self.followings.include?(other_user)
  end

  def feed_posts
    Post.where(user_id: self.following_ids + [self.id])
  end
end
