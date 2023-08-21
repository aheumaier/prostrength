class UsersController < ApplicationController
  before_action :authenticate_user!

  # GET /users/
  def index
    @users = User.all
  end

  # GET /users/1 or /users/1.json
  def show
  end
end
