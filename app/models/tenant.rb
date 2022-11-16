class Tenant < ApplicationRecord
  belongs_to :unit
  has_rich_text :notes

  validates :lease_start_date, presence: true 
  validates :lease_end_date, presence: true

  validates :lease_end_date, comparison: { greater_than: :lease_start_date }

  def lease_months
    (self.lease_start_date..self.lease_end_date).map do |date|
      "#{Date::MONTHNAMES[date.mon]} - #{date.year}"
    end.uniq
  end

  def full_name
    "#{self.first_name} #{self.last_name}"
  end
end
