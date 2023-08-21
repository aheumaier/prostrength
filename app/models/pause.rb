class Pause < ApplicationRecord
    # attr_accessible :lenth

    has_many :workout_sets
    has_many :exercises, :through => :workout_sets
    has_many :lifts, :through => :workout_sets
    has_many :repetitions, :through => :workout_sets
    has_many :tempos, :through => :workout_sets
    has_many :workouts, :through => :workout_sets

end
