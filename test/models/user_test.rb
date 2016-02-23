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

  test 'can get stripe customer' do
    user = create :user
    customer = user.stripe_customer
    assert_not_nil customer
  end

  test 'creates stripe customer after create' do
    token = Stripe::Token.get_test
    user = create :user
    customer = Stripe::Customer.retrieve(user.stripe_customer_id)
    assert_equal user.stripe_customer_id, customer.id
  end

  test 'can save stripe card' do
    token = Stripe::Token.get_test
    user = create :user
    customer = Stripe::Customer.retrieve(user.stripe_customer_id)
    user.save_card token
    cards = customer.sources.all(:object => "card").data.map { |c| c.id }
    assert cards.include? token.card.id
  end
end