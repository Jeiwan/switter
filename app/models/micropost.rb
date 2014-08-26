class Micropost < ActiveRecord::Base
	belongs_to :user

	validates :content, presence: true, length: { in: 1..140 }

	def self.feed user
		followed_ids = user.followed_user_ids
		where("user_id in (:ids) or user_id = :user_id", { ids: followed_ids, user_id: user.id })
	end
end
