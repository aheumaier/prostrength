class CreateRepetitions < ActiveRecord::Migration[7.0]
  def change
    create_table :repetitions do |t|
      t.integer :count

      t.timestamps
    end
  end
end
