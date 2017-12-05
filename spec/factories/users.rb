FactoryBot.define do 
	#static data which is not recomended
	factory :user do 
		first_name "John"
		last_name "Doe"
		email "john.doe@example.com"
		active true
	end

	#so lets create randome data using faker
	factory :randome_user, class: User do 
		first_name {Faker::Name.first_name}
		last_name {Faker::Name.last_name}
		email {Faker::Internet.email}
		active true
	end
end