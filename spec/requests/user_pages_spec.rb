require 'spec_helper'

describe "User Pages" do
  subject{page}

  describe "new user" do
  	before{visit signup_path}
  	it{should have_content("Sign up")}
  	it{should have_title(full_title("Sign up"))}
  end

  describe "profile page spec using active record" do
  	before do
  		@user = User.create(name:"Tester",email:"tester@testing.com",
  			password:"temporary",password_confirmation:"temporary")
  		visit user_path(@user.id)
  	end

  	it{should have_content(@user.name)}
  	it{should have_title(@user.name)}
  end

  describe "profile page spec using factory girl" do
  	let(:user) {FactoryGirl.create(:user)}
  	before{visit user_path(user)}

  	it{should have_content(user.name)}
  	it{should have_title(user.name)}
  end

  describe "Testing signup page" do
  	before{visit signup_path}

  	let(:submit){"Create my account"}

  	describe "Invalid signup request" do
  		it "should not create an account with empty fields" do
  			expect{click_button submit}.not_to change(User,:count)
  		end
  	end

    describe "after submission" do
        before { click_button submit }

        it { should have_title('Sign up') }
        it { should have_content('error') }
    end

  	describe "Valid signup request would increase number of users by 1" do
  		before do
  			fill_in "Name",with:"Example Name"
  			fill_in "Email",with:"user@example.com"
  			fill_in "Password",with:"testing"
  			fill_in "Confirm Password",with:"testing"
  		end

      it "should create user and hence increase the count of users by 1" do
  		  expect{click_button submit}.to change(User,:count).by(1)
      end

      describe "after saving the user" do
        before { click_button submit }
        let(:user) { User.find_by(email: 'user@example.com') }

        it { should have_title(user.name) }
        it { should have_selector('div.alert.alert-success', text: 'Welcome') }
      end
  	end
  end
end