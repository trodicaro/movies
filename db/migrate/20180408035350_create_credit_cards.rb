class CreateCreditCards < ActiveRecord::Migration[5.1]
  def change
    create_table :credit_cards do |t|
      t.string :number
      t.date :expiration
      t.references :customer, foreign_key: true

      t.timestamps
    end
  end
end
