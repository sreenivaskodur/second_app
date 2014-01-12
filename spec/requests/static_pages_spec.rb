require 'spec_helper'

describe "StaticPages" do
  subject{page}
  
  describe "Home page" do
    before{visit root_path}
    it{should have_content('Sample App')}
    it{should have_title('Ruby on rails sample app | Home')}
  end

  describe "Help page" do
    before{visit help_path}
    it{should have_content('Help')}
    it{should have_title('Ruby on rails sample app | Help')}
  end

  describe "About page" do
    before{visit about_path}
    it{should have_content('About')}
    it{should have_title('Ruby on rails sample app | About App')}
  end

  describe "Contact page" do
    before{visit contact_path}
    it{should have_content('Contact Details')}
    it{should have_title('Ruby on rails sample app | Contact')}
  end
end