require 'spec_helper'

describe "games/new" do
  before(:each) do
    assign(:game, stub_model(Game,
      :vs_team => "MyString",
      :goal_id => nil,
      :player_id => nil
    ).as_new_record)
  end

  it "renders new game form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", games_path, "post" do
      assert_select "input#game_vs_team[name=?]", "game[vs_team]"
      assert_select "input#game_goal_id[name=?]", "game[goal_id]"
      assert_select "input#game_player_id[name=?]", "game[player_id]"
    end
  end
end
