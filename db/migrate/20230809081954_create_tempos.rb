class CreateTempos < ActiveRecord::Migration[7.0]
  def change
    create_table :tempos do |t|
      t.string :duration

      t.timestamps
    end
  end
end
