require 'digest'

module UsersHelper
	def gravatar_for email, size=80
		md5 = Digest::MD5.hexdigest email
		content_tag :img, nil, src: "http://gravatar.com/avatar/#{md5}?size=#{size}", class: 'gravatar'
	end
end
