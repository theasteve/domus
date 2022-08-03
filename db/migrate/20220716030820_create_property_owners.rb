class CreatePropertyOwners < ActiveRecord::Migration[7.0]
  def change
    create_table :property_owners do |t|
      t.string :first_name
      t.string :last_name
      t.string :date_of_birth
      t.string :email
      t.string :password

      t.timestamps
    end
  end
end
