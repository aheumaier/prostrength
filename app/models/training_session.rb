class TrainingSession < ApplicationRecord
  belongs_to :workout, counter_cache: true
  belongs_to :plan, optional: true
  belongs_to :user, optional: true, counter_cache: true
end
