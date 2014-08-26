require 'faker'

namespace :db do
	desc "Fill database with sample data"

	task populate: :environment do
		User.create(nickname: 'jeiwan', email: 'me@jeiwan.ru', fullname: 'Ivan Kuznetsov', password: 'dfgcvbdfg', password_confirmation: 'dfgcvbdfg')
		99.times do |n|
			nickname = Faker::Internet.user_name(nil, %w(_)) + rand(1000).to_s
			email = Faker::Internet.email
			fullname = Faker::Name.name
			password = "dfgcvbdfg"
			user = User.create(nickname: nickname, email: email, fullname: fullname, password: password, password_confirmation: password)
			rand(30..100).times do |i|
				user.microposts.create(content: Faker::Lorem.sentence[0..rand(140)])
			end
		end
	end
end
