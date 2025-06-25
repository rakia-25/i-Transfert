class CreateTransactions < ActiveRecord::Migration[7.1]
  def change
    create_table :transactions do |t|
      t.string :nom_expediteur
      t.string :numero_expediteur
      t.string :ville
      t.decimal :montant
      t.string :nom_destinataire
      t.string :numero_destinataire
      t.string :transaction_type
      t.decimal :montant_retrait
      t.string :reference

      t.timestamps
    end
  end
end
