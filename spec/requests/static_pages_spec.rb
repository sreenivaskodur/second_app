require 'spec_helper'

describe "StaticPages" do
  describe "Home page" do
  	it "should have content 'Sample App'" do
  		visit 'static_pages/home'
  		expect(page).to_have_content('Sample App')
  	do
  end
end