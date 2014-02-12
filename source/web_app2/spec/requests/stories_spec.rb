require 'spec_helper'

describe "stories test" do

  before do
    @user1 = User.create!(username: 'johny', email: 'johny@gmail.com', about: 'Let others speak for me.', first_name: 'John', last_name: 'Markovich')
    @user2 = User.create!(username: 'ben', email: 'ben@gmail.com', about: "Oh, I don't know what to say", first_name: 'Ben', last_name: 'Smith')
    @user3 = User.create!(username: 'george', email: 'george@gmail.com', about: 'I an amazing.', first_name: 'George', last_name: 'Adams')

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

  Comment.create!(story_id: k, user_id: 2, comment: "This is a comment.")
  Comment.create!(story_id: k+1, user_id: 1, comment: "This is another comment.")
  Comment.create!(story_id: k+1, user_id: 3, comment: "This is a comment too.")
  end
end

  describe "The user show page" do

    subject { page }
    before { visit user_path(@user1) }

    describe "there are three lists on the the stories page" do
 	    it { should have_selector('h1', text: "Active Stories")}
    	it { should have_selector('h1', text: "Inactive Stories")}
    	it { should have_selector('h1', text: "Commented Stories")}
    end

    describe "the number of stories is correct" do
      it { page.all("div.active table tbody tr").count.should eql(3) }
      it { page.all("div.inactive table tbody tr").count.should eql(1) }
      it { page.all("div.commented table tbody tr").count.should eql(3) }
    end

    describe "the inactive story becomes active" do
      before do
       check('Active') 
       @t = Story.where(active: false)
     end
      it "should check The Checkbox" do
        expect { click_button "Update Story"}.to change(@t, :count).by(-1)
      end
    end
  end
end