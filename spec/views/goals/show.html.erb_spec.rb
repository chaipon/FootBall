require 'spec_helper'

describe "goals/show" do
  before(:each) do
    @goal = assign(:goal, stub_model(Goal,
      :time => 1,
      :game_id => nil,
      :player_id => nil,
      :is_our_goal => ""
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    rendered.should match(//)
    rendered.should match(//)
    rendered.should match(//)
  end
end
