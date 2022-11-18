# RentDashboard is the class that handles the functionality in the
# show page of unit. Displaying information about the rent payments of a tenant

class RentDashboard
  attr_accessor :unit

  STATUSES = [
    "Rent due date not set",
    "Rent Paid",
    "days outstanding"
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
    else
      "#{num_days} " + STATUSES[2]
    end
  end

  def num_days
    unit.day_rent_due - date.day
  end

  private

  def date
    DateTime.now
  end
end
