class Workout < ApplicationRecord
  # attr_accessible :title, :notes

  has_many :workout_sets, dependent: :destroy
  has_many :exercises, through: :workout_sets

  has_many :training_sessions
  has_many :plans, through: :training_sessions

  accepts_nested_attributes_for :workout_sets

  # before_create :update_created_by
  # before_update :update_modified_by

  # def update_created_by
  #   self.created_by = current_user_id
  # end

  # def update_modified_by
  #   self.modified_by = current_user_id
  # end

  # def current_user_id
  #   1
  # end

  # before_validation :find_or_create_exercises

  # private

  # def find_or_create_exercises
  #   logger.info 'Called find_or_create_exercises'
  #   self.workout_sets = workout_sets.map do |set|
  #     logger.info set.exercise_id
  #     Exercise.find_or_create_by(title: set.exercise.title) if set.exercise.id.is_a?(String)
  #   end
  # end
end
