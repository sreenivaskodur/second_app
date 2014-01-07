require 'spec_helper'

describe "StaticPages" do
  describe "Home page" do
  	it "should have content 'Sample App'" do
  		visit '/static_pages/home'
  		expect(page).to have_content('Sample App')
  	end

  	it "should have title 'Home'" do
  		visit '/static_pages/home'
  		expect(page).to have_title("Ruby on rails sample app | Home")
  	end
  end

  describe "Help page" do
  	it "should have content 'Help'" do
  		visit '/static_pages/help'
  		expect(page).to have_content('Help')
  	end

  	it "should have title 'Help'" do
  		visit '/static_pages/help'
  		expect(page).to have_title("Ruby on rails sample app | Help")
  	end
  end

  describe "About page" do
  	it "should have content 'About App'" do
  		visit '/static_pages/about'
  		expect(page).to have_content('About App')
  	end

  	it "should have title 'About'" do
  		visit '/static_pages/about'
  		expect(page).to have_title("Ruby on rails sample app | About App")
  	end
  end
end