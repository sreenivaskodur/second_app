require 'spec_helper'

describe "StaticPages" do
  describe "Home page" do
  	it "should have content 'Sample App'" do
  		visit root_path
  		expect(page).to have_content('Sample App')
  	end

  	it "should have title 'Home'" do
  		visit root_path
  		expect(page).to have_title("Ruby on rails sample app | Home")
  	end
  end

  describe "Help page" do
  	it "should have content 'Help'" do
  		visit help_path
  		expect(page).to have_content('Help')
  	end

  	it "should have title 'Help'" do
  		visit help_path
  		expect(page).to have_title("Ruby on rails sample app | Help")
  	end
  end

  describe "About page" do
  	it "should have content 'About App'" do
  		visit about_path
  		expect(page).to have_content('About App')
  	end

  	it "should have title 'About'" do
  		visit about_path
  		expect(page).to have_title("Ruby on rails sample app | About App")
  	end
  end

  describe "Contact page" do
  	it "should have content 'Contact Details'" do
  		visit contact_path
  		expect(page).to have_content("Contact Details")
  	end

  	it "should have title 'Contact'" do
  		visit contact_path
  		expect(page).to have_title("Ruby on rails sample app | Contact")
  	end
  end
end