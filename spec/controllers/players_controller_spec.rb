require 'spec_helper'

describe PlayersController do
  include Sorcery::TestHelpers::Rails

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
    before(:each) do
      @user = players(:mekun)
      login_user
    end

    after(:each) do
      logout_user
    end

    it "returns http success" do
      get 'edit', id: 1
      response.should be_success
    end
  end

  describe "GET 'index'" do
    before(:each) do
      @user = players(:mekun)
      login_user
      get 'index'
    end

    after(:each) do
      logout_user
    end

    it "returns http success" do
      response.should be_success
    end
    it "should set players who are teams of logon player" do
      assigns(:players).each do |player|
        player.team_id.should == players(:mekun).id
      end
    end
  end

  describe "GET 'create'" do
    it "returns http not success" do
      get 'create', player: {id: 10, password: "mekun1", password_confirmation: "mekun1", name: "mekun10", team_id: 1}
      response.should redirect_to controller: 'sessions', action: 'new', notice: "Singed up!"
    end
  end

  describe "GET 'show'" do
    before(:each) do
      @user = players(:mekun)
      login_user
    end

    after(:each) do
      logout_user
    end

    it "returns http success" do
      get 'show', id:1
      response.should be_success
    end
  end

end
