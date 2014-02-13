require 'spec_helper'

describe "stories test" do

  let(:user1) { FactoryGirl.create(:user) }
  let(:user2) { FactoryGirl.create(:user) }
  let(:user3) { FactoryGirl.create(:user) }

  before do
  
    3.times do |n|
      FactoryGirl.create(:story)
    end

    2.times do |n|
      FactoryGirl.create(:story, user_id: 2)
    end

    2.times do |n|
      FactoryGirl.create(:story, user_id: 3)
    end

    2.times do |n|
      FactoryGirl.create(:story, active: false)
    end

    2.times do |n|
      FactoryGirl.create(:story, user_id: 2, active: false)
    end

    3.times do |n|
      FactoryGirl.create(:story, user_id: 3, active: false)
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

      FactoryGirl.create(:comment, story_id: k, user_id: 2)
      FactoryGirl.create(:comment, story_id: k+1, user_id: 1)
      FactoryGirl.create(:comment, story_id: k+1, user_id: 2)
    end
  end

  describe "The user show page" do

    subject { page }
    before { visit user_path(user1) }

    describe "there are three lists on the the stories page" do
      it { should have_selector('h1', text: "Active Stories")}
      it { should have_selector('h1', text: "Inactive Stories")}
      it { should have_selector('h1', text: "Commented Stories")}
    end

    describe "the number of stories is correct" do
      it { page.all("div.active table tbody tr").count.should eql(3) }
      it { page.all("div.inactive table tbody tr").count.should eql(2) }
      it { page.all("div.commented table tbody tr").count.should eql(3) }
    end

    describe "the inactive story becomes active" do
      before do
       @t = Story.where(active: false)
       check("mycheckbox-#{@t.first.id}")
       #find(:xpath, "//*[@id='edit_story_#{t.id}']").click
       #find(:css, '#edit_story_#{@t.id}#story_active').set(true)
      end

      it "should check The Checkbox" do
      expect { click_button "Active#{@t.first.id}"}.to change(@t, :count).by(-1)
      end
    end
  end
end