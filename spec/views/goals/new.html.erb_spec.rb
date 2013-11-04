require 'spec_helper'

describe "goals/new" do
  fixtures :teams, :games, :players
  before(:each) do
    @game = games(:second_game)
    @team = Team.find(@game.team_id)
    assign(:goal, stub_model(Goal,
      :time => nil,
      :game_id => @game.team_id,
      :player_id => nil,
      :is_our_goal => nil
    ).as_new_record)
  end

  it "renders new goal form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", goals_path, "post" do
      assert_select "input#goal_time[name=?]", "goal[time]"
      assert_select "input#goal_game_id[name=?][type=?]", "goal[game_id]", "hidden"
      assert_select "select#goal_player_id[name=?]", "goal[player_id]"
      assert_select "option", "nyago"
      assert_select "option", "mako"
      assert_select "option", "ben"
      assert_select "input#goal_is_our_goal[name=?][type=?][value=?]", "goal[is_our_goal]","checkbox", "1"
    end
  end
end
