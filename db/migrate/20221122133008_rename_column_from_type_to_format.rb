class RenameColumnFromTypeToFormat < ActiveRecord::Migration[7.0]
  def change
    rename_column(:rent_payments, :type, :format)
  end
end
