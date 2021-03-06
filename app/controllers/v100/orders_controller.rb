class V100::OrdersController < ApplicationController
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
    if @order.update_attributes(order_params)
      render json: @order
    else
      render json: { message: @order.errors }, status: 422
    end
  end

  private

    def order_params
      params.require(:order).permit(:user_id, :store_id, :pickup_time, :status,
                                    product_ids: [])
    end
end