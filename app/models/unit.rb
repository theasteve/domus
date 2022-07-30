class Unit < ApplicationRecord
  belongs_to :property
  has_many :tenants

  def monthly_rent
    Money.new(self.monthly_rent_cents).format
  end
end
