require 'test_helper'

class OrderTest < ActiveSupport::TestCase
  test 'factory is valid' do
    order = build :order
    assert order.valid?
  end

  test 'validates presence of user' do
    order = build :order, user: nil
    assert !order.valid?
  end

  test 'validates presence of store' do
    order = build :order, store: nil
    assert !order.valid?
  end

  test 'validates presence of pickup time' do
    order = build :order, pickup_time: nil
    assert !order.valid?
  end

  test 'validates status' do
    order = build :order, status: nil
    assert !order.valid?
  end

  test 'can get products' do
    product = create :product
    order = create :order, product_ids: [product.id]
    assert order.products.include? product
  end

  test 'can get total price of products' do
    products = [
      create(:product, price_in_cents: 100),
      create(:product, price_in_cents: 200)
    ]
    order = create :order, product_ids: products.map { |p| p.id }
    assert_equal order.total_price_in_cents, 300
  end

  test 'can charge card' do
    stripe_token = Stripe::Token.get_test
    product = create :product
    order = create :order, product_ids: [product.id]
    charge = order.charge_card stripe_token
    assert_equal charge.source.id, stripe_token.card.id
    assert_equal charge.amount, order.total_price_in_cents
  end
end