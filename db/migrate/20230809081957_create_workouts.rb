class CreateWorkouts < ActiveRecord::Migration[7.0]
  def change
    create_table :workouts do |t|
      t.string :title
      t.string :notes
      t.integer :training_sessions_count



      t.timestamps
    end
  end
end
