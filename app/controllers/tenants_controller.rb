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
    @tenant = Tenant.new(tenant_params.merge(unit_id: @unit.id))

    respond_to do |format|
      if @tenant.save
        RentPaymentBuilder.new({lease_end_date: @tenant.lease_end_date,
                                lease_start_date: @tenant.lease_start_date,
                                unit: @unit}).run

        format.html { redirect_to @tenant }
      else
        format.turbo_stream do
          render turbo_stream: turbo_stream.prepend("form", partial: "errors", locals: {tenant: @tenant})
        end
      end
    end
  end

  def edit
    @tenant = Tenant.find(params[:id])
  end

  def update
    @tenant = Tenant.find(params[:id])

    if @tenant.update(tenant_params)
      RentPaymentBuilder.new({ lease_end_date: @tenant.lease_end_date,
                               lease_start_date: @tenant.lease_start_date,
                               unit: @tenant.unit }).run

      redirect_to @tenant, notice: "Tenant was successfully updated."
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
