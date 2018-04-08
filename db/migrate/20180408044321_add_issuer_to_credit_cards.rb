class AddIssuerToCreditCards < ActiveRecord::Migration[5.1]
  def change
    add_column :credit_cards, :issuer, :string
  end
end
