class Plan < ApplicationRecord
  has_many :training_sessions
  has_many :workouts, :through => :training_sessions

  accepts_nested_attributes_for :training_sessions
end
