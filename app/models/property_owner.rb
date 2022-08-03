class PropertyOwner < ApplicationRecord
  has_many :properties

  has_secure_password
end
