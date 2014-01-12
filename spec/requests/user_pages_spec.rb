require 'spec_helper'

describe "User Pages" do
  subject{page}

  describe "new user" do
  	before{visit signup_path}
  	it{should have_content("Sign Up")}
  	it{should have_title(full_title("Sign Up"))}
  end
end