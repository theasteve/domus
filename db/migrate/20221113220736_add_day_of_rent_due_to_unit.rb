class AddDayOfRentDueToUnit < ActiveRecord::Migration[7.0]
  def change
    add_column :units, :day_rent_due, :integer
  end
end
