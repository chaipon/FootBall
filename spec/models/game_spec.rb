require 'spec_helper'

describe Game do
  pending "add some examples to (or delete) #{__FILE__}"
  before do
    @game = games(:first_game)
  end
  it "should belong to team" do
    @game.team.should == teams(:bears)
  end
end
