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
    email = Faker::Internet.email
    create :user, email: email
    user = build :user, email: email
    assert_not user.valid?
  end

  test 'validates presence of roles' do
    user = build :user, roles: []
    assert_not user.valid?
  end

  test 'can generate token' do
    user = create :user
    token = SecureRandom.base64(24)
    user.generate_token(token)
    assert_equal user.token, (user.id.to_s + token)
  end

  test 'can check if token expired' do
    user = create :user
    user.generate_token
    user.token_expiration = Time.now
    assert user.token_expired?
  end
end