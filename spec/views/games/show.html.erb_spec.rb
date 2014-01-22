require 'spec_helper'

describe "games/show" do
  fixtures :teams, :players, :games, :goals
  before(:each) do
    @game = Game.find(1)
    p @game
  end

  it "renders attributes in <p>" do
    render
    rendered.should match(/対戦相手/)
    rendered.should match(/shuyukai/)
    rendered.should match(/12\/11\/21 13:00/)
    rendered.should match(/mekun/)
    rendered.should match(/10分/)
    rendered.should match(/souta/)
    rendered.should match(/12分/)
    rendered.should match(/敵ゴール/)
    rendered.should match(/45分/)
  end
end
