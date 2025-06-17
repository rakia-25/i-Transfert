class AddSoldeAndUserToGuichets < ActiveRecord::Migration[7.1]
  def change
    add_column :guichets, :solde, :decimal
    add_reference :guichets, :user, null: false, foreign_key: true
  end
end
