class AddDateRentPaidToRentPayments < ActiveRecord::Migration[7.0]
  def change
    add_column :rent_payments, :date_rent_paid, :date
  end
end
