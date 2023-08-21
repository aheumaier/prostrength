class CreateWorkoutSets < ActiveRecord::Migration[7.0]
  def change
    create_table :workout_sets do |t|
      t.references :workout, null: false, foreign_key: true
      t.references :exercise, null: false, foreign_key: true
      t.references :lift, null: false, foreign_key: true
      t.references :repetition, null: false, foreign_key: true
      t.references :tempo, null: false, foreign_key: true
      t.references :pause, null: false, foreign_key: true

      t.timestamps
    end
  end
end
