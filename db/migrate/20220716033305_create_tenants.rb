class CreateTenants < ActiveRecord::Migration[7.0]
  def change
    create_table :tenants do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :phone_number
      t.date :lease_start_date
      t.date :lease_end_date
      t.text :notes
      t.references :unit, foreign_key: true

      t.timestamps
    end
  end
end
