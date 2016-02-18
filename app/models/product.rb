class Product < ActiveRecord::Base
  belongs_to :vendor
  belongs_to :store
  belongs_to :order

  validates :name, :price_in_cents, :description, presence: true
  validate :has_owner

  private

    def has_owner
      unless vendor.present? || store.present?
        errors.add(:product, "must belong to vendor or store")
      end
    end
end
