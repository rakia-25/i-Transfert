class CreateIdentityTypes < ActiveRecord::Migration[7.1]
  def change
    create_table :identity_types do |t|
      t.string :name

      t.timestamps
    end
  end
end
