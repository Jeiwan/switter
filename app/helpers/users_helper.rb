require 'digest'

module UsersHelper
	def gravatar_for user, size=80
		md5 = Digest::MD5.hexdigest user.email
		content_tag :img, nil, src: "http://gravatar.com/avatar/#{md5}?size=#{size}", class: 'gravatar'
	end
end
