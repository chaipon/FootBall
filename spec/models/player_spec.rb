require 'spec_helper'

describe Player do
  fixtures :players, :teams
  before do
=begin
    @player = Player.new(name: "mekun", password: "mekun1", password_confirmation: "mekun1", 
                         team_id: 2)
    @team = Team.new(name: "bears")
    @team.save
    @team = Team.new(name: "sting")
    @team.save
=end
    @player = players(:mekun)
  end

  it "should be belong to team" do
    @player.team.should == teams(:bears)
  end
end
