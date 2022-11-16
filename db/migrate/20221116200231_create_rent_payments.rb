class CreateRentPayments < ActiveRecord::Migration[7.0]
  def change
    create_table :rent_payments do |t|
      t.integer :year
      t.string :month
      t.string  :status
      t.integer :days_unpaid
      t.references :unit, foreign_key: true
      t.timestamps
    end
  end
end
