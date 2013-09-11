require 'spec_helper'

describe "games/edit" do
  before(:each) do
    @game = assign(:game, stub_model(Game,
      :vs_team => "MyString",
      :goal_id => nil,
      :player_id => nil
    ))
  end

  it "renders the edit game form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", game_path(@game), "post" do
      assert_select "input#game_vs_team[name=?]", "game[vs_team]"
      #assert_select "input#game_goal_id[name=?]", "game[goal_id]"
      #assert_select "input#game_player_id[name=?]", "game[player_id]"
    end
  end
end
