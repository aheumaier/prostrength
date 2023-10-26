class Workout < ApplicationRecord
  validates :title, presence: true
  has_many :workout_sets, dependent: :destroy
  has_many :exercises, through: :workout_sets

  has_many :training_sessions
  has_many :plans, through: :training_sessions

  accepts_nested_attributes_for :workout_sets
end
