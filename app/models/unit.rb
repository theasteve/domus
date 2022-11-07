class Unit < ApplicationRecord
  belongs_to :property
  has_many :tenants
  has_rich_text :notes
  monetize :monthly_rent_cents

  def monthly_rent
    return 0 if self.monthly_rent_cents.nil?
    Money.new(self.monthly_rent_cents * 100).format
  end
end
