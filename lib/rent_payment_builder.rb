class RentPaymentBuilder
  attr_reader :lease_start_date, :lease_end_date, :unit

  def initialize(args = {})
    @lease_end_date = args.fetch(:lease_end_date)
    @lease_start_date = args.fetch(:lease_start_date)
    @unit = args.fetch(:unit)
  end

  def run
    destroy_rent_payments
    build_rent_payments
  end

  def months_dataset
    (lease_start_date..lease_end_date).map do |date|
      "#{date.month}-#{date.year}"
    end.uniq
  end

  def build_rent_payments
    months_dataset.each do |date|
      rent_payment = RentPayment.new(year: year(date), month: month(date), unit_id: unit.id)

      if rent_payment.save
        Rails.logger.info('Success')
      else
        Rails.logger.error('Something went wrong')
      end
    end
  end

  def destroy_rent_payments
    return if @unit.rent_payments.blank?

    @unit.rent_payments.destroy_all
  end

  def year(date)
    date.split('-')[1]
  end

  def month(date)
    date.split('-')[0].to_i
  end
end