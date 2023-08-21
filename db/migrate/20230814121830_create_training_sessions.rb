class CreateTrainingSessions < ActiveRecord::Migration[7.0]
  def change
    create_table :training_sessions do |t|
      t.references :workout, null: false, foreign_key: true
      t.references :plan, null: false, foreign_key: true

      t.timestamps
    end
  end
end