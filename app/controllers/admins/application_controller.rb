class Admins::ApplicationController < ApplicationController
  before_action :authenticate_admin!

  private

  def this_user
    current_admin
  end
end
