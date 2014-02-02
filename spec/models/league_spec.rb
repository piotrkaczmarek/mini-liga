require 'spec_helper'

describe League do
  
  describe "validation" do
    let(:keeper) { FactoryGirl.create(:user, type: "Keeper") } 
    let(:league) { League.new(name: "LeaG", weekday: 3, sport: "tenis", club_id: 0, keeper_id: keeper.id) }
   
    subject { league } 
    
    it { should be_valid }
    it { should respond_to(:name) }
    it { should respond_to(:sport) }
    it { should respond_to(:weekday) }
    it { should respond_to(:weekday_word) }
    it { should respond_to(:prize) }
    it { should respond_to(:description) }
    it { should respond_to(:club_id) }
    it { should respond_to(:keeper_id) }
    it { should respond_to(:club) }
    it { should respond_to(:seasons) }
    it { should respond_to(:game_classes) }
    it { should respond_to(:meetings) }
 
    describe "when name not present" do
      before { league.name = "" }
      it { should_not be_valid }
    end
    
    describe "when sport not present" do
      before { league.sport = "" }
      it { should_not be_valid }
    end

    describe "when weekday is not between 0..6" do
      describe "when is lower than 0" do
        before { league.weekday = -3}
        it { should_not be_valid }
      end
      describe "when is higher than 6" do
        before { league.weekday = 7 }
        it { should_not be_valid }
      end
    end
    
    describe "when club id is not present" do
      before { league.club_id = nil }
      it { should_not be_valid }
    end

    describe "when keeper id is not present" do
      before { league.keeper_id = nil }
      it { should_not be_valid }
    end

  end

  describe "#weekday_word" do
    
    describe "in english" do
      it "monday" do
        @league = League.new(weekday: 1)
        expect(@league.weekday_word).to eq "monday"
      end
      it "tuesday" do
        @league = League.new(weekday: 2)
        expect(@league.weekday_word).to eq "tuesday"
      end
      it "wednesday" do
        @league = League.new(weekday: 3)
        expect(@league.weekday_word).to eq "wednesday"
      end
      it "thursday" do
        @league = League.new(weekday: 4)
        expect(@league.weekday_word).to eq "thursday"
      end
      it "friday" do
        @league = League.new(weekday: 5)
        expect(@league.weekday_word).to eq "friday"
      end
      it "saturday" do
        @league = League.new(weekday: 6)
        expect(@league.weekday_word).to eq "saturday"
      end
      it "sunday" do
        @league = League.new(weekday: 0)
        expect(@league.weekday_word).to eq "sunday"
      end


    end
  end



end
