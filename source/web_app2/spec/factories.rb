FactoryGirl.define do	
	factory :user do
		sequence :username do |n|
			"username#{n}"
		end

		sequence :email do |n|
			"#{username}@gmail.com"
		end

		sequence :about do |n|
			"description#{n}"
		end

		sequence :first_name do |n|
			"MyName#{n}"
		end

		sequence :last_name do |n|
			"MyLastName#{n}"
		end
	end

	factory :story do
		user_id 1
		active true
		sequence :url do |n|
			"https://stories.com/mystory#{rand(3242)}"
		end
		sequence :title  do |n|
			"MyStory#{n}"
		end
		sequence :description do |n|
			"This is a story. #{n}"
		end
	end

	factory :comment do
		story_id 1
		user_id 1
		sequence :comment do |n|
			"This is my comment. #{n}"
		end
	end
end