class SessionsController < ApplicationController
  def new
  end


  def create
    user = login(params[:name], params[:password], params[:remenber_me])
    if user
      #redirect_back_or_to '/players/', :notice => "Logged in!"
      redirect_back_or_to :controller => 'players', :action => 'index' , :notice => "Logged in!"
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
