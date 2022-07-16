class Property < ApplicationRecord
  belongs_to :property_owner
  has_many :units
end
