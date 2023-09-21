module Users
  class HomeController < Users::ApplicationController
    # GET /users/
    def index
      @trainings = current_user.training_sessions
      return unless current_user.coach?

      @customers = current_user.customers
      @my_workouts = Workout.where(created_by: 1)
    end

    # GET /users/1 or /users/1.json
    def show; end
  end
end
