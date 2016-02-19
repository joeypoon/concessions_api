require 'test_helper'

class Api::V010::StoresControllerTest < ActionController::TestCase
  setup do
    @store = create :store
  end

  test 'can post create' do
    assert_difference 'Store.count' do
      store = build :store
      post :create, store: store.as_json
      assert_response 200
    end
  end

  test 'can get show' do
    get :show, id: @store.id
    assert_response 200
    assert_not_nil assigns(:store)
  end

  test 'can get orders' do
    order = create :order, store: @store
    get :orders, id: @store.id
    assert_response 200
    assert_not_nil assigns(:orders)
    assert assigns(:orders).include?(order)
  end
end