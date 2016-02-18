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
end