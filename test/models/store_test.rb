require 'test_helper'

class StoreTest < ActiveSupport::TestCase
  test 'factory is valid' do
    store = build(:store)
    assert store.valid?
  end

  test 'validates presence of name' do
    request = build :store, name: ""
    assert_not request.valid?
  end

  test 'validates presence of street_one' do
    request = build :store, street_one: ""
    assert_not request.valid?
  end

  test 'validates presence of street_two' do
    request = build :store, street_two: ""
    assert_not request.valid?
  end

  test 'validates presence of city' do
    request = build :store, city: ""
    assert_not request.valid?
  end

  test 'validates presence of state' do
    request = build :store, state: ""
    assert_not request.valid?
  end

  test 'validates presence of zip_code' do
    request = build :store, zip_code: ""
    assert_not request.valid?
  end

  test 'validates numericality of zip_code' do
    request = build :store, zip_code: "fail"
    assert_not request.valid?
  end

  test 'validates presence of vendor' do
    request = build :store, vendor: nil
    assert_not request.valid?
  end

  test 'validates name is unique to vendor' do
    vendor = create :vendor
    create :store, vendor: vendor
    store = build :store, vendor: vendor
    assert_not store.valid?

    vendor2 = create :vendor
    store = create :store, vendor: vendor2
    assert store.valid?
  end
end