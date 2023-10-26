class Exercise < ApplicationRecord
  validates :title, presence: true

  has_many :workout_sets
  has_many :workouts, through: :workout_sets
end
