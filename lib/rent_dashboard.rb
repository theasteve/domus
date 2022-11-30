# RentDashboard is the class that handles the functionality in the
# show page of unit. Displaying information about the rent payments of a tenant

class RentDashboard
  attr_accessor :unit

  STATUSES = [
    "Rent due date not set",
    "Rent Paid",
    "days outstanding",
    "Upcoming bill on the "
  ].freeze

  def initialize(args = {})
    @unit = args.fetch(:unit)
  end

  def current_rent
    @current_rent ||= RentPayment.find_by(
      unit_id: @unit.id,
      month: date.month,
      year: date.year
    )
  end
  
  def current_year_rents
    RentPayment.where('year = ? AND month <= ? AND unit_id = ?', date.year, date.month, unit.id ) 
  end

  def status
    if unit.day_rent_due.blank?
      current_rent.update(status: STATUSES[0])
    elsif current_rent.date_paid
      current_rent.update(status: STATUSES[1])
    elsif date.day > unit.day_rent_due
      current_rent.update(status: "#{num_days} " + STATUSES[2])
    else
      current_rent.update(status: STATUSES[3] + unit.day_rent_due.ordinalize)
    end
  end

  def num_days
    date.day - unit.day_rent_due
  end

  private

  def date
    DateTime.now
  end
end
