require 'spec_helper'

describe "Static pages" do

  let(:base_title) { "Ruby on Rails Tutorial Sample App" }

  describe "Home page" do

    it "deve conter a expressao 'Sample App'" do
      visit home_path
      page.should have_content('Sample App')
    end

    it "deve conter o titulo base" do
      visit home_path
      page.should have_selector('title', :text => "#{base_title}")
    end

    it "nao deve conter o titulo Home" do
      visit home_path
      page.should_not have_selector('title', :text => "Home")
    end
  end

  describe "Help page"	do
  	it "deve conter a expressao 'Help'" do
  		visit help_path
  		page.should have_content('Help')
  	end

    it "deve conter o titulo 'Ruby on Rails Tutorial Sample App | Help'" do
      visit help_path
      page.should have_selector('title', :text => "#{base_title} | Help")
    end
  end

  describe "About page" do
  	it "deve conter a expressao 'About'" do
  		visit about_path
  		page.should have_content('About')
  	end

    it "deve conter o titulo 'Ruby on Rails Tutorial Sample App | About Us'" do
      visit about_path
      page.should have_selector('title', :text => "#{base_title} | About Us")
    end
  end

  describe "Contact page" do
    it "deve conter o h1 Contact" do
      visit contact_path
      page.should have_selector('h1', text: 'Contact')
    end

    it "deve conter o titulo 'Ruby on Rails Tutorial Sample App | Contact'" do
      visit contact_path
      page.should have_selector('title', :text => "Ruby on Rails Tutorial Sample App | Contact")
    end
  end
end