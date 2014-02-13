require 'spec_helper'

describe "Users controller" do

  let(:user) { FactoryGirl.create(:user) }
 
  before do
    FactoryGirl.create_list(:story, 3, user: user)
    FactoryGirl.create_list(:inactive_story, 2, user: user)
    FactoryGirl.create_list(:comment, 3, user: user)
  end

  describe "In the user show page" do

    subject { page }
    before { visit user_path(user) }

    describe "there are three story lists" do
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
       @inactive_stories = Story.where(active: false)
       check("mycheckbox-#{@inactive_stories.first.id}")
      end

      it "should check The Checkbox" do
        expect { click_button "Active#{@inactive_stories.first.id}"}.to change(@inactive_stories, :count).by(-1)
      end
    end
  end
end