class CreatePauses < ActiveRecord::Migration[7.0]
  def change
    create_table :pauses do |t|
      t.integer :length

      t.timestamps
    end
  end
end
