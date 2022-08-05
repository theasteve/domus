class UnitsController < ApplicationController
  def index
    @units = Unit.all
  end

  def show
    @unit = Unit.find(params[:id])
  end

  def new
    @property = Property.find(params[:property_id])
    @unit = Unit.new
  end

  def create
    @property = Property.find(params[:property_id])
    @unit = @property.units.create(unit_params)
  
    if @unit.save
      redirect_to @property
    else
      Rails.logger.error('Unable to save unit')
      render 'new'
    end
  end

  def update
    @unit = Unit.find(params[:id])

    if @unit.update(unit_params)
      redirect_to @unit, notice: 'Unit was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @unit = Unit.find(params[:id])
    @unit.destroy!

    redirect_to root_path
  end

  private

  def unit_params
    params.require(:unit).permit(
      :property_id,
      :apartment_name,
      :status,
      :monthly_rent_cents,
      :rooms,
      :notes
    )
  end
end
