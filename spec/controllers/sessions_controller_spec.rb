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
  describe "GET 'create'" do
    describe "when password is invalid" do
      it "returns http success" do
        get 'create', name: "souta", password: "xxx"
        response.should be_success
      end
    end
=begin
    describe "when password is valid" do
      it "returns http success" do
        get 'create', name: "souta", password: "$2a$10$SAssHijzdbnWOL1mrzen2.ULyawM9HmhiGob.zY9ZHBas8yFRCm/."
        response.should redirect_to "teams/1"
      end
    end
=end
    
  end

end
