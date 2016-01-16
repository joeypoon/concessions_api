class Store < ActiveRecord::Base
  belongs_to :vendor
  has_many :products

  validates :street_one, :street_two, :city, :state, :vendor,
            presence: true
  validates :name, uniqueness: { scope: :vendor,
                                 message: "there's already a store with this name" },
                   presence: true
  validates :zip_code, numericality: { only_integer: true }, presence: true
end