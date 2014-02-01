require 'spec_helper'

describe LeaguesController do

  describe "#index" do
    let(:keeper)  { FactoryGirl.create(:user, type: "Keeper") }
    let(:league1) { FactoryGirl.create(:league, keeper_id: keeper.id, club_id: 0) }
    let(:league2) { FactoryGirl.create(:league, keeper_id: keeper.id, club_id: 0) }
    before do
      get 'index'
    end
    subject { assigns('leagues') }
    it { should include(league1) }
    it { should include(league2) }
  end


end
