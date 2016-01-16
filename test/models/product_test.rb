require 'test_helper'

class ProductTest < ActiveSupport::TestCase
  test 'factory is valid' do
    product = build(:product)
    assert product.valid?
  end

  test 'validates presence of name' do
    request = build :product, name: ""
    assert_not request.valid?
  end

  test 'validates presence of price' do
    request = build :product, price_in_cents: ""
    assert_not request.valid?
  end

  test 'validates presence of description' do
    request = build :product, description: ""
    assert_not request.valid?
  end

  test 'validates presence of vendor or store' do
    request = build :product, store: nil, vendor: nil
    assert_not request.valid?
    request = build :product, vendor: nil
    assert request.valid?
    request = build :product, store: nil
    assert request.valid?
  end
end