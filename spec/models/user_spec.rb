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
		@user = User.new(name: "Example User", email: "user@example.com", password: "foobar", password_confirmation: "foobar")
	end
  	
  	subject { @user }

  	it { should respond_to(:name) }
  	it { should respond_to(:email) }
  	it { should respond_to(:password_digest) } 
  	it { should respond_to(:password) }
  	it { should respond_to(:password_confirmation) }
  	it { should respond_to(:authenticate) }

  	it {should be_valid}

### TESTES PARA O CADASTRAMENTO DO USUÁRIO.

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

### TESTES PARA O E-MAIL
### Apenas algumas formas mais comuns de emails invalidos

	describe "Formato de email deve ser..." do
		it "invalido" do
			addresses = %w[user@foo,com user_at_foo.org example.user@foo.
                     foo@bar_baz.com foo@bar+baz.com]
			addresses.each do |invalid_adress|
				@user.email = invalid_adress
				@user.should_not be_valid
			end
		end	

	    it "deve ser valido" do
	      addresses = %w[user@foo.COM A_US-ER@f.b.org frst.lst@foo.jp a+b@baz.cn]
	      addresses.each do |valid_address|
	        @user.email = valid_address
	        @user.should be_valid
	      end      
    	end
  	end

  	describe "Email deve ser unico" do
  		before do
	  		user_with_same_email = @user.dup
	      	user_with_same_email.email = @user.email.upcase
	     	user_with_same_email.save
  		end

  		it {should_not be_valid}
  	end

### TESTES PARA A SENHA.

  	describe "A senha nao deve estar em branco" do
  		before {@user.password = @user.password_confirmation = " "}
  		it { should_not be_valid}
  	end


  	describe "Senha e confirmacao devem ser iguais" do
  		before {@user.password_confirmation = "senhaErrada" }
  		it {should_not be_valid}
  	end
 
  	describe "A senha nao pode ser nil" do
  		before {@user.password_confirmation = nil}
  		it {should_not be_valid}
  	end

  	describe "A senha nao pode ser menor que 6 caracteres" do
	    before { @user.password = @user.password_confirmation = "a" * 5 }
	    it { should be_invalid }
  	end


### TESTES PARA A AUTENTICAÇÃO.

	describe "retornar o valor do metodo authenticate" do
	 	before { @user.save }
		let(:found_user) { User.find_by_email(@user.email) }

	    describe "com a senha correta" do
	      it { should == found_user.authenticate(@user.password) }
	    end

	    describe "com uma senha incorreta" do
	      let(:user_for_invalid_password) { found_user.authenticate("invalid") }

	      it { should_not == user_for_invalid_password }
	      specify { user_for_invalid_password.should be_false }
	    end
	end
end
