require 'spec_helper'

describe Admin do

  describe "validation" do
      let(:admin) { Admin.new(first_name: "adam", last_name: "Smith", email: "eee@aaa.ccc", phone_number: 700700700,
                          password: "foobar", password_confirmation: "foobar") }
    subject { admin } 
    it { should be_valid }
    it { should respond_to(:first_name) }
    it { should respond_to(:last_name) }
    it { should respond_to(:email) }
    it { should respond_to(:password_digest) }
    it { should respond_to(:password) }
    it { should respond_to(:password_confirmation) }
    it { should respond_to(:type) }
    its(:type) { should eq "Admin" }

  end


end
