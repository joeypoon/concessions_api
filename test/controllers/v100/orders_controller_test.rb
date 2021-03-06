require 'test_helper'

class V100::OrdersControllerTest < ActionController::TestCase
  setup do
    setup_controller_test
    @order = create :order, user: @user
  end

  test 'can post create' do
    assert_difference 'Order.count' do
      product = create :product
      order = build :order, user: @user, product_ids: [product.id]
      post :create, order: order.as_json
      assert_response 200
    end
  end

  test 'can get show' do
    get :show, id: @order.id
    assert_response 200
    assert_not_nil assigns(:order)
  end

  test 'can put update' do
    order = build :order, user: @user, status: "completed"
    put :update, id: @order.id, order: order.as_json
    assert_response 200
    assert_equal order.status, Order.find(@order.id).status
  end
end