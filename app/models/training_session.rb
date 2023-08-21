class TrainingSession < ApplicationRecord
  belongs_to :workout
  belongs_to :plan
end
