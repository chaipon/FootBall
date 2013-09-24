require 'spec_helper'

describe "goals/index" do
  fixtures :games, :players, :teams
  before(:each) do
    assign(:goals, [
      stub_model(Goal,
        :time => 10,
        :game_id => 1,
        :player_id => 3,
        :is_our_goal => "true",
        :created_at => DateTime.parse("2013/10/1 20:00")
      ),
      stub_model(Goal,
        :time => 11,
        :game_id => 2,
        :player_id => 4,
        :is_our_goal => "true",
        :created_at => DateTime.parse("2013/10/1 20:00")
      )
    ])
  end

  it "renders a list of goals" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 10.to_s, :count => 1
    assert_select "tr>td", :text => 11.to_s, :count => 1
    assert_select "tr>td", :text => 4.to_s, :count => 1
    assert_select "tr>td", :text => 3.to_s, :count => 1
    assert_select "tr>td", :text => 1.to_s, :count => 1
    assert_select "tr>td", :text => 2.to_s, :count => 1
    assert_select "tr>td", :text => "true", :count => 2
  end
end
