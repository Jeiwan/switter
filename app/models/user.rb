class User < ActiveRecord::Base

	has_secure_password

	has_many :microposts

	has_many :relationships, foreign_key: "follower_id", dependent: :destroy
	has_many :followed_users, through: :relationships, source: :followed

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

	def feed user
		Micropost.feed user
	end

	#def unfollow user_to_follow
		#followed_users.delete(User.find_by_nickname(user_to_follow))
	#end
	
	private

		def encrypt_password
			if password == password_confirmation
				self.password_digest = BCrypt::Password.create(password)
			end
		end
end
