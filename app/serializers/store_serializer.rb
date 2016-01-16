class StoreSerializer < ActiveModel::Serializer
  attributes :id, :name, :street_one, :street_two, :city, :state, :zip_code
end