class Api::V010::StoresController < ApiBaseController
  def create
    @store = Store.new store_params

    if @store.save!
      render json: @store
    else
      render json: { message: @store.errors }, status: 422
    end
  end

  def show
    @store = Store.find params[:id]
    render json: @store
  end

  def orders
    @store = Store.find params[:id]
    @orders = params[:active] ? @store.orders.active : @store.orders
    render json: @orders
  end

  private

    def store_params
      params.require(:store).permit(:name, :vendor_id, :street_one,
                                    :street_two, :city, :state, :zip_code)
    end
end