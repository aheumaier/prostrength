class CreateWorkouts < ActiveRecord::Migration[7.0]
  def change
    create_table :workouts do |t|
      t.string :title
      t.string :notes
      t.date :scheduled_at



      t.timestamps
    end
  end
end
