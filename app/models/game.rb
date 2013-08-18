class Game < ActiveRecord::Base
  has_many :goals
  has_many :players
  has_many :goal_players , :through => :goals, :source => :player, :class_name => "Player"
  belongs_to :team
  def get_our_goal_players
    goal_players = []
    self.goal_players.each do |goal_player|
      goal_players.push goal_player.name unless goal_player.id == 0
    end
    goal_players.uniq
  end
  def get_our_goal_counts
    goals = self.goals
    goals.where(:is_our_goal => true).count
  end
  def get_your_goal_counts
    goals = self.goals
    goals.where(:is_our_goal => false).count
  end
  def sorted_goals
    goals = self.goals
    goals.order(:time)
  end
end
