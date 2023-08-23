class WorkoutSet < ApplicationRecord
  belongs_to :workout
  belongs_to :exercise
  belongs_to :lift
  belongs_to :repetition
  belongs_to :tempo
  belongs_to :pause
end
