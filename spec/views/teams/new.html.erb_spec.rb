require 'spec_helper'

describe "teams/new" do
  before(:each) do
    assign(:team, stub_model(Team,
      :name => "MyString",
      :game => "",
      :player => ""
    ).as_new_record)
  end

  it "renders new team form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", teams_path, "post" do
      assert_select "input#team_name[name=?]", "team[name]"
      assert_select "input#team_game[name=?]", "team[game]"
      assert_select "input#team_player[name=?]", "team[player]"
    end
  end
end
