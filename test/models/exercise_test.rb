require "test_helper"

# create_table "exercises", force: :cascade do |t|
#   t.string "title"
#   t.string "notes"
#   t.datetime "created_at", null: false
#   t.datetime "updated_at", null: false
# end

class ExerciseTest < ActiveSupport::TestCase
  test "should not add new excercise without title" do
    exercise = Exercise.new
    assert_not exercise.save
  end
end
