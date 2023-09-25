class CreateWorkoutSets < ActiveRecord::Migration[7.0]
  def change
    create_table :workout_sets do |t|
      t.references :workout, null: false, foreign_key: true
      t.references :exercise, null: false, foreign_key: true
      t.integer :repetition
      t.integer :tempo
      t.integer :pause
      t.string :series
      t.string :grip

      t.timestamps
    end
  end
end
