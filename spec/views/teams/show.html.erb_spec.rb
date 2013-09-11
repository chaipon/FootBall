require 'spec_helper'

describe "teams/show" do
  fixtures :teams, :players, :games
  before(:each) do
    #@team = assign(:team, stub_model(Team,
    #  :name => "Name",
    #))
    @team = Team.find(1)
    @players = @team.players
    @games = @team.games
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Bears/)
    rendered.should match(/shuyukai/)
    rendered.should match(/max/)
  end
end
