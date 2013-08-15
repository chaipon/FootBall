require 'spec_helper'

describe Team, "When #name is not set," do
  before do
    @team = Team.new
  end

  it "should be not valid" do
    @team.should_not be_valid
  end
end
describe Team, "When #name is set," do
  before do
    @team = Team.new(name: "Bears")
  end

  it "should be valid" do
    @team.should be_valid
  end
end
