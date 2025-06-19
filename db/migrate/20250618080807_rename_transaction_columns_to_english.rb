class RenameTransactionColumnsToEnglish < ActiveRecord::Migration[7.1]
  def change
    rename_column :transactions, :nom_expediteur, :sender_name
    rename_column :transactions, :numero_expediteur, :sender_number
    rename_column :transactions, :ville, :destination 
    rename_column :transactions, :montant, :amount
    rename_column :transactions, :nom_destinataire, :recipient_name
    rename_column :transactions, :numero_destinataire, :recipient_number
    rename_column :transactions, :montant_retrait, :amount_recipient
    rename_column :transactions, :transaction_type, :transaction_type
    rename_column :transactions, :reference, :reference
  end
end
