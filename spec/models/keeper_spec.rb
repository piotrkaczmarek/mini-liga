require 'spec_helper'

describe Keeper do

  describe "validation" do
      let(:keeper) { Keeper.new(first_name: "adam", last_name: "Smith", email: "eee@aaa.ccc", phone_number: 700700700,
                          password: "foobar", password_confirmation: "foobar", club_id: 0) }
    subject { keeper } 
    it { should be_valid }
    it { should respond_to(:first_name) }
    it { should respond_to(:last_name) }
    it { should respond_to(:email) }
    it { should respond_to(:password_digest) }
    it { should respond_to(:password) }
    it { should respond_to(:password_confirmation) }
    it { should respond_to(:club_id) }
    it { should respond_to(:type) }
    its(:type) { should eq "Keeper" }

  end


end
