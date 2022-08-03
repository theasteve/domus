class PropertiesController < ApplicationController
  def index
    @properties = Property.all
    redirect_to action: 'new' if @properties.empty? 
  end

  def show
    @property = Property.find(params[:id])
  end

  def new
    @property = Property.new
  end

  def create
    # TODO: Current user should be property owner.
    # current_user.properties.create(property_params)
    @property_owner = PropertyOwner.last
    @property = @property_owner.properties.create(property_params)

    if @property.save
      redirect_to @property
    else
      Rails.logger.error('Unable to save user')
      render 'new'
    end
  end

  private

  def property_params
    params.require(:property).permit(
      :property_owner_id,
      :building_name,
      :address,
      :city,
      :state,
      :zipcode,
      :country,
      :photo
    )
  end
end
