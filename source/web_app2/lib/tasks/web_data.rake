namespace :db do
	desc "Fill database with user data"
	task populate: :environment do
		make_users
		make_stories
		make_comments
	end
end

def make_users
	User.create!(username: 'johny', email: 'johny@gmail.com', about: 'Let others speak for me.', first_name: 'John', last_name: 'Markovich')
	User.create!(username: 'ben', email: 'ben@gmail.com', about: "Oh, I don't know what to say", first_name: 'Ben', last_name: 'Smith')
	User.create!(username: 'george', email: 'george@gmail.com', about: 'I an amazing.', first_name: 'George', last_name: 'Adams')
end

def make_stories

	3.times do |n|
		Story.create!(user_id: 1, active: true, url: "https://stories.com/mystory #{rand(2131)}", title: "My Story#{rand(2131)}", description: "This is a great story. #{rand(2131)}")
	end

	2.times do |n|
		Story.create!(user_id: 2, active: true, url: "https://stories.com/mystory #{rand(2131)}", title: "My Story#{rand(2131)}", description: "This is a great story. #{rand(2131)}")
	end

	2.times do |n|
		Story.create!(user_id: 3, active: true, url: "https://stories.com/mystory #{rand(2131)}", title: "My Story#{rand(2131)}", description: "This is a great story. #{rand(2131)}")
	end

		Story.create!(user_id: 1, active: false, url: "https://stories.com/mystory #{rand(2131)}", title: "My Story#{rand(2131)}", description: "This is a great story. #{rand(2131)}")

	2.times do |n|
		Story.create!(user_id: 2, active: false, url: "https://stories.com/mystory #{rand(2131)}", title: "My Story#{rand(2131)}", description: "This is a great story. #{rand(2131)}")
	end

	3.times do |n|
		Story.create!(user_id: 3, active: false, url: "https://stories.com/mystory #{rand(2131)}", title: "My Story#{rand(2131)}", description: "This is a great story. #{rand(2131)}")
	end	
end


# 	# fs = Story.first
# 	 all_s = @story.all
# 	 ss = all_s[1]

# 	#fu = User.first
# #	all_u = User.all
# #	su = all_u[1]

# 	t = @user.stories.first


# 	t.each { |comment| user.story.comments.create!(comment: "comment author is #{(story.user_id +1)%3}").where(active: true) }

# 	ss.each { |comment| user.story.comments.create!(comment: "comment author is #{(story.user_id +1)%3}").where(active: true) }
# 	ss.each { |comment| user.story.comments.create!(comment: "comment author is #{(story.user_id +2)%3}").where(active: true) }

# if User.stories.where(active: true).first
# 	Comment.create!(user_id: 1,)
# end
def make_comments
  k=0
  3.times do |n|
	case n
	when 0
		k = 1
	when 1
		k = 4
	when 2
		k = 6
	end

	Comment.create!(story_id: k, user_id: rand(3)+1, comment: "This is a comment.")
	Comment.create!(story_id: k+1, user_id: rand(3)+1, comment: "This is another comment.")
	Comment.create!(story_id: k+1, user_id: rand(3)+1, comment: "This is a comment too.")
  end
end