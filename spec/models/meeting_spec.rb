require 'spec_helper'

describe Meeting do
  let(:league) { League.create(name: "LeaG", weekday: 3, sport: "tenis", club_id: 0, keeper_id: 0) }
  let(:meeting) { league.game_classes.first.meetings.new(date: Time.now) }
  
  subject { meeting }

  it { should be_valid }
  it { should respond_to(:game_class) }
  it { should respond_to(:season) }
  it { should respond_to(:league) }
  
  its(:league) { should eq league }
 
end
