require 'test_helper'

class Api::V010::VendorsControllerTest < ActionController::TestCase
  setup do
    @vendor = create :vendor
  end

  test 'can post create' do
    assert_difference 'Vendor.count' do
      vendor = attributes_for :vendor
      post :create, vendor: vendor
      assert_response 200
    end
  end

  test 'can get show' do
    get :show, id: @vendor.id
    assert_response 200
    assert_not_nil assigns(:vendor)
  end
end
