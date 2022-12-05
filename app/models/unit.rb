class Unit < ApplicationRecord
  belongs_to :property
  has_one :tenant
  has_many :rent_payments
  has_rich_text :notes
  monetize :monthly_rent_cents

  def days_until_rent
    date_time = DateTime.now
    date_time.end_of_month.day - date_time.day
  end

  def monthly_rent
    return 0 if self.monthly_rent_cents.nil?

    Money.new(self.monthly_rent_cents * 100).format
  end
end
