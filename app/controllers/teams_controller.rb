class TeamsController < ApplicationController
  before_action :set_team, only: [:show, :edit, :update, :destroy]

  # GET /teams
  # GET /teams.json
  def index
    @entity = Team.new
    @teams = Team.all
  end

  # GET /teams/1
  # GET /teams/1.json
  def show
    @entity = @team
    render 'shared/profile'
  end

  # GET /teams/new
  def new
    @team = Team.new
  end

  # GET /teams/1/edit
  def edit
  end

  # POST /teams
  # POST /teams.json
  def create
    @team = Team.new(team_params)

    respond_to do |format|
      if @team.save
        format.html { flash[:success] = 'Team was successfully created.'; redirect_to @team }
        format.json { render :show, status: :created, location: @team }
      else
        format.html { render :new }
        format.json { render json: @team.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /teams/1
  # PATCH/PUT /teams/1.json
  def update
    respond_to do |format|
      if @team.update(team_params)
        format.html { flash[:success] = 'Team was successfully updated.'; redirect_to @team }
        format.json { render :show, status: :ok, location: @team }
      else
        format.html { render :edit }
        format.json { render json: @team.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /teams/1
  # DELETE /teams/1.json
  def destroy
    if params[:mutant_id]
      @team.unlink_from_mutant(params[:mutant_id])
      respond_to do |format|
        format.js do
          @mutant = Mutant.find(params[:mutant_id])
          @mutants_count = @team.mutants.count
          @tasks_count = @team.tasks.count
        end
      end
    elsif params[:task_id]
      Task.destroy(params[:task_id])
      respond_to do |format|
        format.js do
          @mutants_count = @team.mutants.count
          @tasks_count = @team.tasks.count
        end
      end
    else
      @team.destroy
      respond_to do |format|
        format.html { flash[:success] = 'Team was successfully destroyed.'; redirect_to teams_url  }
        format.json { head :no_content }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_team
      @team = Team.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def team_params
      params.require(:team).permit(:name, :description, :enabled)
    end
end
