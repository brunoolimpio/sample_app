require 'spec_helper'

describe "Users Pages" do
	subject { page }

	describe "Sign Up Page" do
		before { visit signup_path }

		it { should have_selector('h1',    text: 'Sign Up') }
		it { should have_selector('title', text: full_title('')) }
	end
end
