require 'spec_helper'

describe "StaticPages" do
  describe "Home page" do
  	it "should have content 'Sample App'" do
  		visit '/static_pages/home'
  		expect(page).to have_content('Sample App')
  	end
  end

  describe "Help page" do
  	it "should have content 'Help'" do
  		visit '/static_pages/help'
  		expect(page).to have_content('Help')
  	end
  end

  describe "About page" do
  	it "should have content 'About App'" do
  		visit '/static_pages/about'
  		expect(page).to have_content('About App')
  	end
  end
end