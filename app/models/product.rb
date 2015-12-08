class Product < ActiveRecord::Base
  validates :name, :price_in_cents, :description, presence: true
end
