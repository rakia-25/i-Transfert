class RemoveAmountRecipientFromTransactions < ActiveRecord::Migration[7.1]
  def change
    remove_column :transactions, :amount_recipient, :decimal
  end
end
