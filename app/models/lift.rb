class Lift < ApplicationRecord
    validates :weight, presence: true

    has_many :workout_sets
    has_many :exercises, :through => :workout_sets
    has_many :workouts, :through => :workout_sets
    has_many :repetitions, :through => :workout_sets
    has_many :tempos, :through => :workout_sets
    has_many :pauses, :through => :workout_sets

end
