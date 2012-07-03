require 'spec_helper'

describe ApplicationHelper do

  describe "full_title" do
    it "deve incluir o titulo da pagina" do
      full_title("titulo").should =~ /titulo/
    end

    it "deve incluir o titulo base" do
      full_title("titulo").should =~ /^Ruby on Rails Tutorial Sample App/
    end

    it "A home nao deve incluir uma barra no titulo" do
      full_title("").should_not =~ /\|/
    end
  end
end