class CreateHistoricals < ActiveRecord::Migration[7.1]
  def change
    create_table :historicals do |t|
      t.decimal :balance_before
      t.decimal :balance_after
      t.references :guichet, null: false, foreign_key: true
      t.references :operation, polymorphic: true, null: false

      t.timestamps
    end
  end
end
