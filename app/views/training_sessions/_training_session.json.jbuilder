json.extract! training_session, :id, :workout_id, :plan_id, :created_at, :updated_at
json.url training_session_url(training_session, format: :json)
