class TasksController < ApplicationController
  before_action :set_task, only: [:step, :edit, :update, :destroy]

  def index
    @entity = Team.find(params[:id])
    render partial: 'shared/tasks_profile'
  end

  # GET /tasks/new
  def new
    @task = Task.new
    @team = Team.find(params[:team_id])
  end

  # GET /tasks/1/edit
  def edit
    @team = Team.find(params[:team_id])
  end

  # POST /tasks
  # POST /tasks.json
  def create
    @task = Task.new(task_params)
    @team = Team.find(params[:team][:id])
    @entity = @team
    respond_to do |format|
      if @task.save
        @team.tasks << @task
        format.js do
          @tasks_count = @task.team.tasks.count
        end
      else
        format.js do
          render :new
        end
      end
    end
  end

  # PATCH/PUT /tasks/1
  # PATCH/PUT /tasks/1.json
  def update
    @team = Team.find(params[:team][:id])
    @entity = @team
    respond_to do |format|
      if @task.update(task_params)
        format.js do
        end
      else
        format.js do
          render :new
        end
      end
    end
  end

  def step
    @task.achieved += params[:step].to_f
    @task.achieved = 100.0 if @task.achieved > 100.0
    @task.achieved = 0.0 if @task.achieved < 0.0
    @task.save
    respond_to do |format|
      format.js { }
    end
  end

  # DELETE /tasks/1
  # DELETE /tasks/1.json
  def destroy
      @task.destroy
      respond_to do |format|
        format.js do
          @tasks_count = @task.team.tasks.count
        end
      end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_task
    @task = Task.find(params[:id] || 1)
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def task_params
    params.require(:task).permit(:name, :description, :start, :end, :achieved, :priority)
  end
end
