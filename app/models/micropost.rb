class Micropost < ActiveRecord::Base
	belongs_to :user

	default_scope { order('created_at DESC') }
	validates :content, presence: true, length: { in: 1..140 }

	def self.feed opts = {}
		user = opts[:user]
		followed_ids = user.followed_user_ids
		f = where("user_id in (:ids) or user_id = :user_id", { ids: followed_ids, user_id: user.id })
		opts[:limit] ? f.limit(20) : f
	end
end
