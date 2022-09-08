class TenantsController < ApplicationController
  def index
    @tenants = Tenant.all
  end

  def show
    @tenant = Tenant.find(params[:id])
  end

  def new
    @unit = Unit.find(params[:unit_id])
    @tenant = Tenant.new
  end

  def create
    @unit = Unit.find(params[:unit_id])
    @tenant = @unit.tenants.create(tenant_params)

    if @tenant.save
      redirect_to @tenant
    else
      Rails.logger.error('Unable to save Tenant')
      render 'new'
    end
  end

  def update
    @tenant = Tenant.find(params[:id])

    if @tenant.update(tenant_params)
      redirect_to @tenant, notice: 'Tenant was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @tenant = Tenant.find(params[:id])
    @tenant.destroy!

    redirect_to root_path
  end

  private

  def tenant_params
    params.require(:tenant).permit(
      :unit_id,
      :first_name,
      :last_name,
      :email,
      :phone_number,
      :lease_start_date,
      :lease_end_date,
      :notes
    )
  end
end
