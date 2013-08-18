require 'spec_helper'

describe "goals/index" do
  before(:each) do
    assign(:goals, [
      stub_model(Goal,
        :time => 1,
        :game_id => nil,
        :player_id => nil,
        :is_our_goal => ""
      ),
      stub_model(Goal,
        :time => 1,
        :game_id => nil,
        :player_id => nil,
        :is_our_goal => ""
      )
    ])
  end

  it "renders a list of goals" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
  end
end
