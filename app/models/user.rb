class User < ActiveRecord::Base

	attr_accessor :password, :password_confirmation

	before_save :encrypt_password

	validates_presence_of :nickname, :email, :fullname, :password, :password_confirmation
	validates_uniqueness_of :nickname, :email, :fullname
	validates :nickname, length: { in: 5..32 }
	validates :fullname, length: { in: 5..64 }
	validates :password, confirmation: true, length: { in: 8..128 }

	private

		def encrypt_password
			if password == password_confirmation
				self.password_digest = BCrypt::Password.create(password)
			end
		end
end
