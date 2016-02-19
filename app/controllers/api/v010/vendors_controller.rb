class Api::V010::VendorsController < ApiBaseController
  def create
    @vendor = Vendor.new vendor_params

    if @vendor.save!
      render json: @vendor
    else
      render json: { message: @vendor.errors }, status: 422
    end
  end

  def show
    @vendor = Vendor.find params[:id]
    render json: @vendor
  end

  private

    def vendor_params
      params.require(:vendor).permit(:name)
    end
end