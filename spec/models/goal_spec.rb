require 'spec_helper'

describe Goal do
  it "should new goal is our goal." do
    goal = Goal.new
    goal.is_our_goal.should == true
  end
end
