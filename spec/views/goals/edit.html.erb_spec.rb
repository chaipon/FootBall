require 'spec_helper'

describe "goals/edit" do
  before(:each) do
    @goal = assign(:goal, stub_model(Goal,
      :time => 1,
      :game_id => nil,
      :player_id => nil,
      :is_our_goal => ""
    ))
  end

  it "renders the edit goal form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", goal_path(@goal), "post" do
      assert_select "input#goal_time[name=?]", "goal[time]"
      assert_select "input#goal_game_id[name=?]", "goal[game_id]"
      assert_select "input#goal_player_id[name=?]", "goal[player_id]"
      assert_select "input#goal_is_our_goal[name=?]", "goal[is_our_goal]"
    end
  end
end
