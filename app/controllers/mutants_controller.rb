class MutantsController < ApplicationController
  before_action :set_mutant, only: [:show, :edit, :update, :destroy]

  # GET /mutants
  # GET /mutants.json
  def index
    @entity = Mutant.new
    @mutants = Mutant.all
  end

  # GET /mutants/1
  # GET /mutants/1.json
  def show
    @entity = @mutant
    render 'shared/profile'
  end

  # GET /mutants/new
  def new
    @mutant = Mutant.new
  end

  # GET /mutants/1/edit
  def edit
  end

  # POST /mutants
  # POST /mutants.json
  def create
    @mutant = Mutant.new(mutant_params)
    uploaded_io = params[:mutant][:image]
    unless uploaded_io.nil?
      File.open(Rails.root.join('app', 'assets', 'images', 'profiles', 'mutants', uploaded_io.original_filename), 'wb') do |file|
        file.write(uploaded_io.read)
      end
      @mutant.image = uploaded_io.original_filename
    end
    respond_to do |format|
      if @mutant.save
        format.html { flash[:success] = 'Mutant was successfully created.'; redirect_to @mutant }
        format.json { render :show, status: :created, location: @mutant }
      else
        format.html { render :new }
        format.json { render json: @mutant.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /mutants/1
  # PATCH/PUT /mutants/1.json
  def update
    params_to_update = mutant_params
    uploaded_io = params[:mutant][:image]
    unless uploaded_io.nil?
      File.open(Rails.root.join('app', 'assets', 'images', 'profiles', 'mutants', uploaded_io.original_filename), 'wb') do |file|
        file.write(uploaded_io.read)
        end
      params_to_update[:image] = uploaded_io.original_filename
    end
    respond_to do |format|
      if @mutant.update(params_to_update)
        format.html { flash[:success] = 'Mutant was successfully updated.'; redirect_to @mutant }
        format.json { render :show, status: :ok, location: @mutant }
      else
        format.html { render :edit }
        format.json { render json: @mutant.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /mutants/1
  # DELETE /mutants/1.json
  def destroy
    if params[:team_id]
      @tasks_unassigned = @mutant.unlink_from_team(params[:team_id])
      respond_to do |format|
        format.js do
          @teams_count = @mutant.teams.count
          @tasks_count = @mutant.tasks.count
        end
      end
    elsif params[:task_id]
      @mutant.unlink_from_task(params[:task_id])
      respond_to do |format|
        format.js do
          @teams_count = @mutant.teams.count
          @tasks_count = @mutant.tasks.count
        end
      end
    else
      @mutant.destroy
      respond_to do |format|
        format.html { flash[:success] = 'Mutant was successfully destroyed..'; redirect_to mutants_url }
        format.json { head :no_content }
      end
    end

  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_mutant
      @mutant = Mutant.find(params[:id] || 1)
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def mutant_params
      params.require(:mutant).permit(:name, :aliases, :real_name, :image, :email,
      :mobile, :place_of_birth, :identity, :biography, :height, :weight, :eyes, :hair, :skintone, :more_info_link)
    end
end
