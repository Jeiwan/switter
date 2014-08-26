FactoryGirl.define do
	factory :user do
		sequence(:nickname) { |n| "Pedro #{n}" }
		sequence(:fullname) { |n| "Pedro Alvarez #{n}" }
		sequence(:email) { |n| "pedro#{n}@mexi.co" }
		password "asdzxcasd"
		password_confirmation "asdzxcasd"
	end
	factory :micropost do
		content "Hello, world!"
		user
	end
end
