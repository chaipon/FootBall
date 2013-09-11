require 'spec_helper'

describe Game do
  #pending "add some examples to (or delete) #{__FILE__}"
  fixtures :games, :teams
  before do
    @game = Game.find(1)
  end
  it "should belong to team" do
    @game.team.should == teams(:bears)
  end
end
