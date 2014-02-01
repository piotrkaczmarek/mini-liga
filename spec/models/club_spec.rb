require 'spec_helper'

describe Club do
  
  describe "validation" do
    let(:city) { City.create(name: "New York") }
    let(:club) { city.clubs.new(name: "SportGym") }
    subject { club } 
    
    it { should be_valid }
    it { should respond_to(:name) }
    it { should respond_to(:city) }
    it { should respond_to(:leagues) }

    describe "when name not present" do
      before { club.name = "" }
      it { should_not be_valid }
    end
   
    describe "when city id not present" do
      before { club.city_id = nil }
      it { should_not be_valid }
    end

  end

end
