class WorkoutSet < ApplicationRecord
  # attr_accessible :workout_id, :exercise_id, :lift_id :repetition_id, :tempo_id, :pause_id, :

  belongs_to :workout
  belongs_to :exercise
  belongs_to :lift
  belongs_to :repetition
  belongs_to :tempo
  belongs_to :pause
end
