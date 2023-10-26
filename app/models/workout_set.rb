class WorkoutSet < ApplicationRecord
  GRIPS = %w[none pronated suppinated narrow wide]
  validates :repetition, :tempo, :pause, :series, presence: true
  validates :repetition, :tempo, :pause, numericality: { greater_than: 0 }

  belongs_to :workout
  belongs_to :exercise
end
