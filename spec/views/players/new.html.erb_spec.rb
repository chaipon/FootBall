require 'spec_helper'

describe "players/new.html.erb" do
  fixtures :teams
  before(:each) do
    assign(:player, stub_model(Player,
      :name => nil,
    ).as_new_record)
    @teams = Team.all
  end

  it "renders new player form" do
    render

    assert_select "form[action=?][method=?]", players_path, "post" do
      assert_select "input#player_name[name=?]", "player[name]"
      assert_select "input#player_password[name=?]", "player[password]"
      assert_select "input#player_password_confirmation[name=?]", "player[password_confirmation]"
      assert_select "select#player_team_id[name=?]", "player[team_id]" do
        assert_select "option[value=?]", "1", "Bears" 
        assert_select "option[value=?]", "2", "Sting" 
      end
    end

  end
end
