class Vendor < ActiveRecord::Base
  has_many :stores
  has_many :products

  validates :name, presence: true
end
