class Vendor < ActiveRecord::Base
  has_many :stores
  has_many :products
  has_many :orders, through: :stores

  validates :name, presence: true
end
