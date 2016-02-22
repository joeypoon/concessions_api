class OrderSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :store_id, :pickup_time, :status, :products

  def status
    object.display_status
  end

  def products
    ActiveModel::ArraySerializer.new(object.products, each_serializer: ProductSerializer)
  end
end