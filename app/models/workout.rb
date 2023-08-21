class Workout < ApplicationRecord
    # attr_accessible :title, :notes

    has_many :workout_sets, dependent: :destroy
    has_many :exercises, :through => :workout_sets
    has_many :lifts, :through => :workout_sets
    has_many :repetitions, :through => :workout_sets
    has_many :tempos, :through => :workout_sets
    has_many :pauses, :through => :workout_sets

    has_many :training_sessions
    has_many :plans, :through => :training_sessions

    accepts_nested_attributes_for :workout_sets
end


#  combinations for ws:
#  workout_sets: 1 - 20
#  exercise_sets: unlimited
#  lift_sets: 1-200
#  repetition_sets: 1-100
#  tempo_sets: 20
#  20 * 200 * *100 *20 = 8.000.000 entries
