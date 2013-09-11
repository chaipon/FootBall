require 'spec_helper'

describe "goals/new" do
  before(:each) do
    assign(:goal, stub_model(Goal,
      :time => 1,
      :game_id => 1,
      :player_id => nil,
      :is_our_goal => "true"
    ).as_new_record)
  end

  it "renders new goal form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", goals_path, "post" do
      assert_select "input#goal_time[name=?]", "goal[time]"
      assert_select "input#goal_game_id[name=?]", "goal[game_id]"
      assert_select "input#goal_player_id[name=?]", "goal[player_id]"
      assert_select "input#goal_is_our_goal[name=?]", "goal[is_our_goal]"
    end
  end
end
