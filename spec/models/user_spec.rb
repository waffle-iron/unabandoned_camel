require 'rails_helper'

describe User do
  describe "validations" do
    context "invalid attributes" do
      it "is invalid without email" do
        user = User.create(password:"password")
        
        expect(user).to be_invalid
      end

      it "is invalid without a password" do
        user = User.create(email:"email@google.com")
        
        expect(user).to be_invalid
      end        
    end

    context "unique attributes" do
      it "is invalid with duplicate email" do
        User.create(email:"email@google.com", password:"password")
        user = User.create(email:"email@google.com", password:"pass")

        expect(user).to be_invalid
      end
    end
  end
end
