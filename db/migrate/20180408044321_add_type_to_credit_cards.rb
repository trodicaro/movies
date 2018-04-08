class AddTypeToCreditCards < ActiveRecord::Migration[5.1]
  def change
    add_column :credit_cards, :type, :string
  end
end
