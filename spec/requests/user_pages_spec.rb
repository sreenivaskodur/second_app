require 'spec_helper'

describe "User Pages" do
  subject{page}

  describe "new user" do
  	before{visit signup_path}
  	it{should have_content("Sign Up")}
  	it{should have_title(full_title("Sign Up"))}
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
end