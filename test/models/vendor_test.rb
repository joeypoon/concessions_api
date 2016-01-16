require 'test_helper'

class VendorTest < ActiveSupport::TestCase
  test 'factory is valid' do
    vendor = build(:vendor)
    assert vendor.valid?
  end

  test 'validates presence of name' do
    request = build :vendor, name: ""
    assert_not request.valid?
  end
end
