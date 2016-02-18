class OrderSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :store_id, :pickup_time, :status

  def status
    object.display_status
  end
end
