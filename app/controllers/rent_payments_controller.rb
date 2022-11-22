class RentPaymentsController < ApplicationController
  def edit
    @rent_payment = RentPayment.find(params[:id])
  end

  def update
    @rent_payment = RentPayment.find(params[:id])

    if @rent_payment.update(rent_payment_params)
      redirect_to @rent_payment.unit
    end
  end

  private

  def rent_payment_params
    params.require(:rent_payment).permit(:date_paid, :type)
  end
end
