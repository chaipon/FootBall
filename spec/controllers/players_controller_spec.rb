require 'spec_helper'

describe PlayersController do
  fixtures :players, :teams

  describe "GET 'new'" do
    it "returns http success" do
      get 'new'
      response.should be_success
    end
=begin
    it "should be none player" do
      get 'new'
      assigns[:player].should == Player.new
    end
=end
  end

  describe "GET 'edit'" do
    it "returns http success" do
      get 'edit', id: 1
      response.should be_success
    end
  end

  describe "GET 'index'" do
    it "returns http success" do
      get 'index'
      response.should be_success
    end
  end

  describe "GET 'create'" do
    it "returns http not success" do
      get 'create', player: {id: 10, password: "mekun1", password_confirmation: "mekun1", name: "mekun10", team_id: 1}
      response.should_not be_success
    end
  end

  describe "GET 'show'" do
    it "returns http success" do
      get 'show', id:1
      response.should be_success
    end
  end

end
