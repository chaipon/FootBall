require 'spec_helper'

describe "goals/edit" do
  include Sorcery::TestHelpers::Rails
  fixtures :teams, :players, :games
  before(:each) do
    @user = players(:souta)
    #login_user

    @game = games(:first_game)
    @team = Team.find(@game.team_id)
  end
  after(:each) do
    #logout_user
  end


  it "renders the edit goal form (our goal)" do
    @goal = assign(:goal, stub_model(Goal,
      :id => 1,
      :time => 1,
      :game_id => @game.id,
      :player_id => 1,
      :is_our_goal => true
    ))
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", goal_path(@goal), "post" do
      assert_select "input#goal_time[name=?]", "goal[time]"
      assert_select "input#goal_game_id[name=?][type=?]", "goal[game_id]", "hidden"
      assert_select "select#goal_player_id[name=?]", "goal[player_id]"
      assert_select "option", "mekun"
      assert_select "option", "souta"
      assert_select "option", "chie"
      assert_select "option", "keita"
      assert_select "input#goal_is_our_goal[name=?][type=?][checked=?]", "goal[is_our_goal]", "checkbox", "checked", count: 1
    end
  end
  it "renders the edit goal form (enemy goal)" do
    @goal = assign(:goal, stub_model(Goal,
      :id => 1,
      :time => 10,
      :game_id => @game.id,
      :player_id => 1,
      :is_our_goal => false
    ))
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", goal_path(@goal), "post" do
      assert_select "input#goal_time[name=?][value=?]", "goal[time]", "10"
      assert_select "input#goal_game_id[name=?][type=?]", "goal[game_id]", "hidden"
      assert_select "select#goal_player_id[name=?]", "goal[player_id]"
      assert_select "option", "mekun"
      assert_select "option", "souta"
      assert_select "option", "chie"
      assert_select "option", "keita"
      assert_select "input#goal_is_our_goal[name=?][type=?][checked=?]", "goal[is_our_goal]", "checkbox", "checked", count: 0
      assert_select "input#goal_is_our_goal", name: "goal[is_our_goal]", type: "checkbox"
    end
  end
end
