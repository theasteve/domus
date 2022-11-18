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
      month: Date::MONTHNAMES[date.month],
      year: date.year
    )
  end

  def status
    if unit.day_rent_due.blank?
      STATUSES[0]
    elsif current_rent.date_paid
      STATUSES[1]
    elsif date.day > unit.day_rent_due
      "#{num_days} " + STATUSES[2]
    else
      STATUSES[3] + unit.day_rent_due.ordinalize
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
