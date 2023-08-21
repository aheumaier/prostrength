class WorkoutSetsController < ApplicationController
  before_action :set_workout_set, only: %i[ show edit update destroy ]
  before_action :authenticate_user!

  # GET /workout_sets or /workout_sets.json
  def index
    @workout_sets = WorkoutSet.all
  end

  # GET /workout_sets/1 or /workout_sets/1.json
  def show
  end

  # GET /workout_sets/new
  def new
    @workout_set = WorkoutSet.new
  end

  # GET /workout_sets/1/edit
  def edit
  end

  # POST /workout_sets or /workout_sets.json
  def create
    @workout_set = WorkoutSet.first_or_create_by(workout_set_params)
    # @workout_set = WorkoutSet.new(workout_set_params)

    respond_to do |format|
      if @workout_set.save
        format.html { redirect_to workout_set_url(@workout_set), notice: "Workout set was successfully created." }
        format.json { render :show, status: :created, location: @workout_set }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @workout_set.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /workout_sets/1 or /workout_sets/1.json
  def update
    respond_to do |format|
      if @workout_set.update(workout_set_params)
        format.html { redirect_to workout_set_url(@workout_set), notice: "Workout set was successfully updated." }
        format.json { render :show, status: :ok, location: @workout_set }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @workout_set.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /workout_sets/1 or /workout_sets/1.json
  def destroy
    @workout_set.destroy

    respond_to do |format|
      format.html { redirect_to workout_sets_url, notice: "Workout set was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_workout_set
      @workout_set = WorkoutSet.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def workout_set_params
      params.require(:workout_set).permit(:workout_id, :exercise_id, :lift_id, :repetition_id, :tempo_id, :pause_id)
    end
end
