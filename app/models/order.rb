class Order < ActiveRecord::Base
  belongs_to :user
  belongs_to :store
  has_one :vendor, through: :store, autosave: false
  has_many :transactions

  scope :active, -> { where.not(status: "completed") }
  scope :completed, -> { where(status: "completed") }

  validates :user, :store, :pickup_time, :status, presence: true
  validate :valid_status

  def display_status
    "Order " + status
  end

  def products
    Product.where(id: self.product_ids)
  end

  def total_price_in_cents
    products.pluck(:price_in_cents).reduce(:+)
  end

  def charge_card token
    charge = Stripe::Charge.create(
      source: token,
      amount: total_price_in_cents,
      currency: "usd",
      description: "Order #{self.id}"
    )
    stripe_charge_id = charge.id
    charge
  end

  private

    def valid_status
      valid = ["placed", "received", "completed"]
      valid.include? status
    end
end