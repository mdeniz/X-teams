class TasksController < ApplicationController
  before_action :set_task, only: [:step, :edit, :update, :destroy]

  # GET /tasks/new
  def new
    @task = Task.new
  end

  # GET /tasks/1/edit
  def edit
  end

  # POST /tasks
  # POST /tasks.json
  def create
    @task = Task.new(task_params)

    respond_to do |format|
      if @task.save
        format.html { flash[:success] = 'Task was successfully created.'; redirect_to @task }
        format.json { render :show, status: :created, location: @task }
      else
        format.html { render :new }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tasks/1
  # PATCH/PUT /tasks/1.json
  def update
    respond_to do |format|
      if @task.update(task_params)
        format.html { flash[:success] = 'Task was successfully updated.'; redirect_to @task }
        format.json { render :show, status: :ok, location: @task }
      else
        format.html { render :edit }
        format.json { render json: @task.errors, status: :unprocessable_entity }
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
        format.html { flash[:success] = 'Task was successfully destroyed..'; redirect_to tasks_url }
        format.json { head :no_content }
      end
    
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_task
    @task = Task.find(params[:id] || 1)
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def task_params
    params[:task]
  end
end
