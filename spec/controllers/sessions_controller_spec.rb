require 'spec_helper'

describe SessionsController do

  describe "GET 'new'" do
    describe "When player has not logged in." do
      it "returns http success" do
        get 'new'
        response.should be_success
      end
    end
=begin
    describe "When player has logged in." do
      it "returns http redirect to player's tema page" do
        #login("souta", "souta", false)
        get 'new'
        response.should be_redirect
        response.should redirect_to "/teams/1"
        logout
      end
    end
=end
  end
=begin
  describe "GET 'create'" do
    it "returns http success" do
      get 'create'
      response.should be_success
    end
  end
=end

end
