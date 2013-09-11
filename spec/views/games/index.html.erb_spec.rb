require 'spec_helper'

describe "games/index" do
  before(:each) do
    assign(:games, [
      stub_model(Game,
        :vs_team => "Vs Team",
        :date => Time.now,
        :goal_id => nil,
        :player_id => nil
      ),
      stub_model(Game,
        :vs_team => "Bears",
        :date => Time.now,
        :goal_id => nil,
        :player_id => nil
      )
    ])
  end

  it "renders a list of games" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Vs Team".to_s, :count => 1
    assert_select "tr>td", :text => "Bears".to_s, :count => 1
    #assert_select "tr>td", :text => "Date".to_s, :count => 2
    #assert_select "tr>td", :text => Time.now.to_s, :count => 2
    #assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
