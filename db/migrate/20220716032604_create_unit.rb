class CreateUnit < ActiveRecord::Migration[7.0]
  def change
    create_table :units do |t|
      t.string :apartment_name
      t.string :status
      t.integer :monthly_rent_cents
      t.string :rooms
      t.references :property, foreign_key: true

      t.timestamps
    end
  end
end
