require 'spec_helper'

describe City do
  
  describe "validation" do
    let(:city) { City.create(name: "New York") }
    subject { city } 
    
    it { should be_valid }
    it { should respond_to(:name) }
    it { should respond_to(:clubs) }
    it { should respond_to(:leagues) }

    describe "when name not present" do
      before { city.name = "" }
      it { should_not be_valid }
    end
  end

end
