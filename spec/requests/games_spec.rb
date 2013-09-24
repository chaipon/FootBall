require 'spec_helper'

describe "Games" do
  include Sorcery::TestHelpers::Rails
  fixtures :teams, :players, :games
  before(:each) do
    @user = players(:souta)
    get games_path
    login_user
  end

  after(:each) do
    logout_user
  end

  describe "GET /games" do

    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get games_path
      response.status.should be(302)
    end
  end
end
