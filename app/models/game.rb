class Game < ActiveRecord::Base
  has_many :goals
  has_many :players
  has_many :goal_players , :through => :goals, :source => :player, :class_name => "Player"
  belongs_to :team
  def get_our_goal_players
    goal_players = []
    goals = self.goals
    our_goals = goals.where(:is_our_goal => true).order(:time)
    our_goals.each do |goal|
      goal_players.push Player.find(goal.player_id).name
    end
    goal_players.uniq
  end
  def get_goal_counts_by_name(name)
    counts = 0
    goals = self.goals
    our_goals = goals.where(:is_our_goal => true)
    our_goals.each do |goal|
      counts += 1 if Player.find(goal.player_id).name == name
    end
    counts
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
  def get_date_str
    date.strftime('%y/%m/%d %H:%M')
  end
end
