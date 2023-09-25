module WorkoutHelper
  def exercise_name(_exercise)
    logger.info "exercise_name: #{_exercise}"
    # Exercise.find(_exercise).name
  end
end
