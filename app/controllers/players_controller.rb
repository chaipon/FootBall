class PlayersController < ApplicationController
  def new
    @player = Player.new
    @teams = Team.all
  end

  def create
    @player = Player.new(player_params)
    if @player.save
      #redirect_to 'app/', :notice => "Singed up!"
      redirect_to :controller => :sessions, :action => :new, :notice => "Singed up!"
    else
      render :new
    end
  end
  def index
    unless current_user
      redirect_to :controller => :sessions, :action => :new
    else
      @players = current_user.get_team_players
      respond_to do |format|
        format.html
      end
    end
  end
  def edit
    @player = Player.find(params[:id])
    @teams = Team.all
  end

  def show
    unless current_user
      redirect_to :controller => :sessions, :action => :new 
    else
      @player = Player.find(params[:id])
      respond_to do |format|
        format.html
      end
    end
  end
  private
  def player_params
      params.require(:player).permit(:name, :password, :password_confirmation, :salt, :team_id)
  end
end
