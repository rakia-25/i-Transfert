class RenameTransactionsToTransferts < ActiveRecord::Migration[7.1]
  def change
    rename_table :transactions, :transferts
  end
end
