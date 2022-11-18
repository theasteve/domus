class RemoveDateRentPaidFromRentPayments < ActiveRecord::Migration[7.0]
  def change
    remove_column :rent_payments, :date_rent_paid, :date
  end
end
