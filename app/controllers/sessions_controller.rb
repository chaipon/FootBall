class SessionsController < ApplicationController
  def new
    if current_user
      redirect_to "/teams/#{current_user.team_id}"
    end
  end

  def create
    player = login(params[:name], params[:password], params[:remenber_me])
    if player
      redirect_to "/teams/#{player.team_id}", :notice => "Logged in!"
      #redirect_back_or_to "/teams/#{player.team_id}", :notice => "Logged in!"
    else
      flash.now.alert = "Name or password was invalid"
      render :new
    end
  end

  def destroy
    logout
    redirect_to :action => 'new', :notice => "Logged out!"
  end


end
