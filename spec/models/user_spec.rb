require 'spec_helper'

describe User do

  describe "validation" do
    let(:user) { FactoryGirl.create(:user) }
 
    subject { user }

    it { should be_valid }
    it { should respond_to(:first_name) }
    it { should respond_to(:last_name) }
    it { should respond_to(:email) }
    it { should respond_to(:password_digest) }
    it { should respond_to(:password) }
    it { should respond_to(:password_confirmation) }
    it { should respond_to(:type) }

    describe "not valid when" do

      describe "first_name not present" do
        before { user.first_name = nil }
        it { should_not be_valid }
      end 

      describe "last_name not present" do
        before { user.last_name = nil }
        it { should_not be_valid }
      end

      describe "email not present" do
        before { user.email = nil }
        it { should_not be_valid }
      end
   
      describe "email not valid" do
        describe "with no @ in it" do
          before { user.email = "34rf3" }
          it { should_not be_valid }
        end
        describe "with no . after @ " do
          before { user.email = "34rf3" }
          it { should_not be_valid }
        end
      end

      describe "when password is not present" do
        before do
          @user = User.new(first_name: user.first_name, last_name: user.last_name, email: user.email, password: "")
        end
        it "should not be valid" do
          expect(@user).to_not be_valid
        end
      end

      describe "when password confirmation does not match" do
        before do
          @user = User.new(first_name: user.first_name, last_name: user.last_name, email: user.email, password_confirmation: "mismatch")
        end
        it "should not be valid" do
          expect(@user).to_not be_valid
        end
      end
    end
    

  end  



end