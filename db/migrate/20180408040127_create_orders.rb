class CreateOrders < ActiveRecord::Migration[5.1]
  def change
    create_table :orders do |t|
      t.datetime :time
      t.decimal :amount, precision: 5, scale: 2
      t.references :customer, foreign_key: true
      t.references :movie, foreign_key: true
      t.references :theater, foreign_key: true

      t.timestamps
    end
  end
end
