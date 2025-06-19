class AddCityToAgencies < ActiveRecord::Migration[7.1]
  def change
    add_reference :agencies, :city, null: false, foreign_key: true
  end
end
