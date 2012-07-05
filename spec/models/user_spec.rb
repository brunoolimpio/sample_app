# == Schema Information
#
# Table name: users
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  email      :string(255)
#  created_at :datetime        not null
#  updated_at :datetime        not null
#

require 'spec_helper'

describe User do
	before do
		@user = User.new(name: "Example User", email: "user@example.com")
	end
  	
  	subject { @user }

  	it { should respond_to(:name) }
  	it { should respond_to(:email) }

  	it {should be_valid}

	describe "quando o nome nao for preenchido" do
		before {@user.name=""}

		it {should_not be_valid}
	end

	describe "Se o e-mail nao for preenchido" do
		before {@user.email=""}

		it {should_not be_valid}
	end

	describe "O nome nao deve ter mais de 50 caracteres" do
		before {@user.name= "a" * 51}
		it {should_not be_valid}
	end
end