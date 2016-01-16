require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test 'factory is valid' do
    user = build(:user)
    assert user.valid?
  end

  test 'validates presence of name' do
    user = build :user, name: ""
    assert_not user.valid?
  end

  test 'validates presence of email' do
    user = build :user, email: ""
    assert_not user.valid?
  end

  test 'validates uniqueness of email' do
    user = create :user
    user = build :user
    assert_not user.valid?
  end
end
