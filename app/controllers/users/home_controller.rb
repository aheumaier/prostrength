module Users
  class HomeController < Users::ApplicationController
    # GET /users/
    def index
      @trainings = current_user.training_sessions
      @customers = current_user.customers if current_user.coach?
    end

    # GET /users/1 or /users/1.json
    def show; end
  end
end
