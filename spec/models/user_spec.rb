require 'rails_helper'

RSpec.describe User, type: :model do
  
  subject { described_class.new(name: "Test", email: "test@test.com", password: "password", password_confirmation: "password") }
  
  describe 'Validations' do
      
    it "should validate when fully filled out" do
      expect(subject).to be_valid
    end
    it "should require a name" do
      subject.name = nil
      expect(subject).to_not be_valid
      expect(subject.errors.full_messages.first).to eq "Name can't be blank"
    end
    
    #email validations
    it "should require an email" do
      subject.email = nil
      expect(subject).to_not be_valid
      expect(subject.errors.full_messages.first).to eq "Email can't be blank"
    end
    it "should error if the email already exists" do
      @user1 = User.create(name: "Test1", email: "test@test.com", password: "password", password_confirmation: "password")
      @user2 = User.new(name: "Test2", email: "TEST@TEST.COM", password: "password", password_confirmation: "password")
      expect(@user2).to_not be_valid
      expect(@user2.errors.full_messages.first).to eq "Email has already been taken"
    end
    
    #password validations
    it "should require a password" do
      subject.password = nil
      expect(subject).to_not be_valid
      expect(subject.errors.full_messages.first).to eq "Password can't be blank"
    end
    it "should require password and password validation to match" do
      subject.password_confirmation = "wrong"      
      expect(subject).to_not be_valid
      expect(subject.errors.full_messages.first).to eql "Password confirmation doesn't match Password"
    end
    it "should require a password length of at least 6" do
      subject.password = "test"
      subject.password_confirmation = "test"
      expect(subject).to_not be_valid
      expect(subject.errors.full_messages.first).to eql "Password is too short (minimum is 6 characters)"
    end
  end
end
