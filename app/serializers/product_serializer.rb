class ProductSerializer < ActiveModel::Serializer
  attributes :id, :name, :price_in_cents, :description
end
