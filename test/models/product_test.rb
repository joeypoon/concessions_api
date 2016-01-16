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
end