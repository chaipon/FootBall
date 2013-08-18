class Game < ActiveRecord::Base
  has_many :goals
  has_many :players
  has_many :goal_players , :through => :goals, :source => :player, :class_name => "Player"
  belongs_to :team
end
