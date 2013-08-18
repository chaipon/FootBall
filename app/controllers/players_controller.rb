class PlayersController < ApplicationController
  before_filter :require_login
  def new
    @player = Player.new
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
    @players = Player.all

    respond_to do |format|
      format.html
    end
  end
  def edit
    @player = Player.find(params[:id])
  end

  def show
    @player = Player.find(params[:id])
    respond_to do |format|
      format.html
    end
  end
  private
  def player_params
      params.require(:player).permit(:name, :password, :password_confirmation, :salt, :team_id)
  end
end
