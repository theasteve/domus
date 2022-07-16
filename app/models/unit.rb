class Unit < ApplicationRecord
  belongs_to :property
  has_many :tenants
end

