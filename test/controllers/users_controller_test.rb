require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  setup do
    @user = FactoryGirl.create :user
  end

  test 'can get index' do
    get :index
    assert_response 200
    assert_not_nil assigns(:users)
  end

  test 'can post create' do
    assert_difference 'User.count' do
      user = @user.as_json.merge(email: "another_email@gmail.com")
      post :create, user: user.as_json
      assert_response 200
    end
  end

end
