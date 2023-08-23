class TrainingSession < ApplicationRecord
  belongs_to :workout
  belongs_to :plan, optional: true
  belongs_to :user, optional: true
end
