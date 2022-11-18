class AddTypeToRentPayments < ActiveRecord::Migration[7.0]
  def change
    add_column :rent_payments, :type, :string
  end
end
