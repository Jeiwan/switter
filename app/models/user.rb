class User < ActiveRecord::Base

	has_secure_password

	has_many :microposts

	has_many :relationships, foreign_key: "follower_id", dependent: :destroy
	has_many :followed_users, through: :relationships, source: :followed

	has_many :reverse_relationships, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy
	has_many :followers, through: :reverse_relationships

	#attr_accessor :password, :password_confirmation

	before_save :encrypt_password

	validates_presence_of :nickname, :email, :fullname, :password, :password_confirmation
	validates_uniqueness_of :nickname, :email
	validates :nickname, length: { in: 5..32 }
	validates :fullname, length: { in: 5..64 }
	validates :password, confirmation: true, length: { in: 8..128 }

	def follow user_to_follow
		relationships.create(followed_id: user_to_follow.id)
	end

	def follows? user
		relationships.find_by(followed_id: user.id) if user
	end

	def unfollow user_to_unfollow
		relationships.find_by(followed_id: user_to_unfollow.id).destroy
	end

	def feed opts = {}
		opts[:limit] = true if opts[:limit].nil?
		opts[:user] = self if opts[:user].nil?
		Micropost.feed user: opts[:user], limit: opts[:limit]
	end

	private

		def encrypt_password
			if password == password_confirmation
				self.password_digest = BCrypt::Password.create(password)
			end
		end
end
