class GoalsController < ApplicationController
  before_filter :require_login
  before_action :set_goal, only: [:show, :edit, :update, :destroy]

  # GET /goals
  # GET /goals.json
  def index
    @goals = Goal.all
  end

  # GET /goals/1
  # GET /goals/1.json
  def show
  end

  # GET /goals/new
  def new
    @goal = Goal.new
    @game_id = params[:game_id]
    game = Game.find(@game_id)
    @team = Team.find(game.team_id)
  end

  # GET /goals/1/edit
  def edit
    @goal = Goal.find(params[:id])
    @game_id = @goal.game_id
    game = Game.find(@game_id)
    @team = Team.find(game.team_id)
  end

  # POST /goals
  # POST /goals.json
  def create
    not_regist_palyer_id_when_this_goal_is_your_goal
    @goal = Goal.new(goal_params)

    respond_to do |format|
      if @goal.save
        format.html { redirect_to :controller => :games, :action => 'show', 
           :id => @goal.game.id, notice: 'Goal was successfully created.' }
        format.json { render action: 'show', status: :created, location: @goal }
      else
        format.html { render action: 'new' }
        format.json { render json: @goal.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /goals/1
  # PATCH/PUT /goals/1.json
  def update
    respond_to do |format|
      if @goal.update(goal_params)
        format.html { redirect_to :controller => :games, :action => 'show', 
           :id => @goal.game.id, notice: 'Goal was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @goal.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /goals/1
  # DELETE /goals/1.json
  def destroy
    @goal.destroy
    respond_to do |format|
      format.html { redirect_to goals_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_goal
      @goal = Goal.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def goal_params
      params.require(:goal).permit(:time, :game_id, :player_id, :is_our_goal)
    end
    def not_regist_palyer_id_when_this_goal_is_your_goal
      if params[:goal][:is_our_goal] == "0"
        params[:goal][:player_id] = 0
      end
    end
end
