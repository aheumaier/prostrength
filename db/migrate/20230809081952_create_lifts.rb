class CreateLifts < ActiveRecord::Migration[7.0]
  def change
    create_table :lifts do |t|
      t.integer :weight

      t.timestamps
    end
  end
end