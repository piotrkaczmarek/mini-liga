require 'spec_helper'

describe UsersController do

  describe "#promote" do
    describe "when current user is an admin" do

      describe "and promoting other user" do
        let(:user) { FactoryGirl.create(:user, type: "Player") }
        before { UsersController.any_instance.stub(:admin_user) }       
        it "should change user's type" do
          new_type = "Keeper"
          post :promote, {id: user.id, type: new_type }
          expect(user.reload.type).to eq new_type
        end
      end
   
      describe "and promoting current user" do

      end

    end

    describe "when current user is not an admin" do
 
    end



    



  end



end
