require 'spec_helper'

describe "Static pages" do

  describe "Home page" do

    it "deve conter a expressao 'Sample App'" do
      visit '/static_pages/home'
      page.should have_content('Sample App')
    end

    it "deve conter o titulo 'Ruby on Rails Tutorial Sample App | Home'" do
      visit '/static_pages/home'
      page.should have_selector('title', :text => "Ruby on Rails Tutorial Sample App | Home")
    end
  end

  describe "Help page"	do
  	it "deve conter a expressao 'Help'" do
  		visit '/static_pages/help'
  		page.should have_content('Help')
  	end

    it "deve conter o titulo 'Ruby on Rails Tutorial Sample App | Help'" do
      visit '/static_pages/help'
      page.should have_selector('title', :text => "Ruby on Rails Tutorial Sample App | Help")
    end
  end

  describe "About page" do
  	it "deve conter a expressao 'About'" do
  		visit '/static_pages/about'
  		page.should have_content('About')
  	end

    it "deve conter o titulo 'Ruby on Rails Tutorial Sample App | About Us'" do
      visit '/static_pages/about'
      page.should have_selector('title', :text => "Ruby on Rails Tutorial Sample App | About Us")
    end
  end
end