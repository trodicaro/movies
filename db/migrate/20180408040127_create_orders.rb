class CreateOrders < ActiveRecord::Migration[5.1]
  def change
    create_table :orders do |t|
      t.decimal :total_cost, precision: 5, scale: 2
      t.integer :seat_count
      t.references :customer, foreign_key: true
      t.references :screening, foreign_key: true

      t.timestamps
    end
  end
end
