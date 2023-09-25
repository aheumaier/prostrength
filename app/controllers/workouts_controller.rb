class WorkoutsController < ApplicationController
  before_action :set_workout, only: %i[show edit update destroy]
  before_action :authenticate_user!

  # GET /workouts or /workouts.json
  def index
    @workouts = Workout.all
    @users = User.all
    @my_workouts = @workouts.where(created_by: current_user.id)
  end

  # GET /workouts/1 or /workouts/1.json
  def show
    # @workout = Workout.find(params[:id])
    @creator = User.find(@workout.created_by)
  end

  # GET /workouts/new
  def new
    @workout = Workout.new
    @workout_sets = @workout.workout_sets.build
  end

  # GET /workouts/1/edit
  def edit
    @exercise_name = Exercise.find_by(id: params[:exercise_id])
  end

  # POST /workouts or /workouts.json
  def create
    create_params = workout_params # create temp var to modify workout_params
    validate_or_update_strings_in_id_params(create_params) # modify params through temp var
    @workout = Workout.new(create_params)

    u = current_user
    @workout.created_by = u.id

    respond_to do |format|
      if @workout.save
        format.html { redirect_to workout_url(@workout), notice: 'Workout was successfully created.' }
        format.json { render :show, status: :created, location: @workout }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @workout.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /workouts/1 or /workouts/1.json
  def update
    respond_to do |format|
      create_params = workout_params # create temp var to modify workout_params
      validate_or_update_strings_in_id_params(create_params) # modify params through temp var

      u = current_user
      @workout.modified_by = u.id
      if @workout.update(create_params)
        format.html { redirect_to workout_url(@workout), notice: 'Workout was successfully updated.' }
        format.json { render :show, status: :ok, location: @workout }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @workout.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /workouts/1 or /workouts/1.json
  def destroy
    @workout.destroy

    respond_to do |format|
      format.html { redirect_to workouts_url, notice: 'Workout was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_workout
    @workout = Workout.find(params[:id])
  end

  # Only allow a list of trusted parameters through
  def workout_params
    params.require(:workout).permit([
                                      :title,
                                      :notes,
                                      { workout_sets_attributes: %i[
                                        id
                                        _destroy
                                        workout_id
                                        exercise_id
                                        grip
                                        series
                                        repetition
                                        tempo
                                        pause
                                      ] }

                                    ])
  end

  def validate_or_update_strings_in_id_params(create_params)
    create_params[:workout_sets_attributes].each do |_k, set_params|
      if set_params[:exercise_id].is_a?(String)
        create_params[:workout_sets_attributes][_k][:exercise_id] =
          Exercise.find_or_create_by(title: set_params[:exercise_id]).id
      end
    end
    logger.info create_params[:workout_sets_attributes]
  end
end
