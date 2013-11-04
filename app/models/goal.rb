class Goal < ActiveRecord::Base
  belongs_to :game
  belongs_to :player
  def initialize *args
    super *args
  end
  def goal_team_players(team)
    players = Player.where(:team_id => team.id)
  end
end
