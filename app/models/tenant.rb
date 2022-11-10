class Tenant < ApplicationRecord
  belongs_to :unit
  has_rich_text :notes

  validates :lease_start_date, presence: true 
  validates :lease_end_date, presence: true

  def full_name
    "#{self.first_name} #{self.last_name}"
  end
end
