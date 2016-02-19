class Api::V010::ProductsController < ApiBaseController
  def index
    @products = Product.all
    render json: @products
  end

  def create
    @product = Product.new product_params

    if @product.save!
      render json: @product
    else
      render json: { message: @product.errors }, status: 422
    end
  end

  def show
    @product = Product.find params[:id]
    render json: @product
  end

  private

    def product_params
      params.require(:product).permit(:name, :price_in_cents, :description,
                                      :vendor_id, :store_id)
    end
end