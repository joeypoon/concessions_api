require 'test_helper'

class V100::UsersControllerTest < ActionController::TestCase
  setup do
    setup_controller_test
  end

  test 'can get index' do
    get :index
    assert_response 200
    assert_not_nil assigns(:users)
  end

  test 'can post create' do
    assert_difference 'User.count' do
      user = attributes_for :user
      post :create, user: user
      assert_response 200
    end
  end

  test 'can get show' do
    get :show, id: @user.id
    assert_response 200
    assert_not_nil assigns(:user)
  end

  test 'can get all orders' do
    order = create :order, user: @user
    order2 = create :order, user: @user
    get :orders, id: @user.id
    assert_response 200
    assert_not_nil assigns(:orders)
    assert assigns(:orders).include?(order)
    assert assigns(:orders).include?(order2)
  end

  test 'can get active orders' do
    order = create :order, user: @user
    bad_order = create :order, user: @user, status: "completed"
    get :orders, id: @user.id, active: true
    assert_response 200
    assert_not_nil assigns(:orders)
    assert assigns(:orders).include?(order)
    assert_not assigns(:orders).include?(bad_order)
  end

  test 'can login user' do
    post :login, user: { email: @user.email, password: @user.password }
    assert_response 200
  end
end