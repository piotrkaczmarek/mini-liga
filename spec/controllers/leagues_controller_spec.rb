require 'spec_helper'

describe LeaguesController do

  describe "#index" do
    let(:league1) { FactoryGirl.create(:league) }
    let(:league2) { FactoryGirl.create(:league) }
    before do
      get 'index'
    end
    subject { assigns('leagues') }
    it { should include(league1) }
    it { should include(league2) }
  end



end
