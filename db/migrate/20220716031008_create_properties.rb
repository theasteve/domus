class CreateProperties < ActiveRecord::Migration[7.0]
  def change
    create_table :properties do |t|
      t.string :building_name
      t.string :address
      t.string :city
      t.string :state
      t.string :zipcode
      t.string :country
      t.text   :notes
      t.references :property_owner, foreign_key: true

      t.timestamps
    end
  end
end
