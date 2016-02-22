ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all
  include FactoryGirl::Syntax::Methods

  # Add more helper methods to be used by all tests here...

  def setup_controller_test
    @user = create :user
    @token = SecureRandom.base64(24)
    @user.generate_token(@token)
    @request.headers['x-auth-token'] = @user.token
  end
end