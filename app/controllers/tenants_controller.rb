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
    @tenant = @unit.tenants.new(tenant_params)
    
    respond_to do |format|
      if @tenant.save
        format.html { redirect_to @tenant }
      else
        format.turbo_stream do 
          render turbo_stream: turbo_stream.prepend('form', partial: 'errors', locals: { tenant: @tenant }) 
        end
      end
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
