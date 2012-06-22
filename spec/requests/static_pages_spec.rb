require 'spec_helper'

describe "Static pages" do

  describe "Home page" do

    it "deve conter a expressao 'Sample App'" do
      visit '/static_pages/home'
      page.should have_content('Sample App')
    end
  end

  describe "Help page"	do
  	it "deve conter a expressao 'Help'" do
  		visit '/static_pages/help'
  		page.should have_content('Help')
  	end
  end

  describe "About page" do
  	it "deve conter a expressao 'About'" do
  		visit '/static_pages/about'
  		page.should have_content('About')
  	end
  end
end