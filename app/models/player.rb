class Player < ActiveRecord::Base
  authenticates_with_sorcery!
  validates_confirmation_of :password

  validates_presence_of :password, :on => :create
  validates_presence_of :name
  validates_uniqueness_of :name

  belongs_to :team
  has_many :games
  has_many :goals

  def get_team_players
    self.team.players
  end
end
