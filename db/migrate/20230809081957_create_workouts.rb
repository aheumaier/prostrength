class CreateWorkouts < ActiveRecord::Migration[7.0]
  def change
    create_table :workouts do |t|
      t.string :title
      t.string :notes
      t.integer :created_by
      t.integer :modified_by
      t.integer :training_sessions_counts

      t.timestamps
    end
  end
end
