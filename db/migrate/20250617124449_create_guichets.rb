class CreateGuichets < ActiveRecord::Migration[7.1]
  def change
    create_table :guichets do |t|
      t.string :name
      t.string :address
      t.references :agency, null: false, foreign_key: true

      t.timestamps
    end
  end
end
