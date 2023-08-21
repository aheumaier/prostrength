class Tempo < ApplicationRecord
    # attr_accessible :duration

    has_many :workout_sets
    has_many :exercises, :through => :workout_sets
    has_many :lifts, :through => :workout_sets
    has_many :repetitions, :through => :workout_sets
    has_many :workouts, :through => :workout_sets
    has_many :pauses, :through => :workout_sets

end
