class CreateScreenings < ActiveRecord::Migration[5.1]
  def change
    create_table :screenings do |t|
      t.datetime :scheduled_at
      t.references :movie, foreign_key: true
      t.references :theater, foreign_key: true

      t.timestamps
    end
  end
end
