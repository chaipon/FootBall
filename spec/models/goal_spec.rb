require 'spec_helper'

describe Goal do
  it "should our goal of new goal is nil." do
    goal = Goal.new()
    goal.is_our_goal.should == nil
  end
end
