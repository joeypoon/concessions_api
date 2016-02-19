class Api::V010::OrdersController < ApiBaseController
  def create
    @order = Order.new order_params

    if @order.save!
      render json: @order
    else
      render json: { message: @order.errors }, status: 422
    end
  end

  def show
    @order = Order.find params[:id]
    render json: @order
  end

  def update
    @order = Order.find params[:id]
    if @order.update_attributes(status: order_params[:status])
      render json: @order
    else
      render json: { message: @order.errors }, status: 422
    end
  end

  private

    def order_params
      params.require(:order).permit(:user_id, :store_id, :pickup_time, :status,
                                    :product_ids)
    end
end