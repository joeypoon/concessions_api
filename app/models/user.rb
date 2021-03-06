class User < ActiveRecord::Base
  has_secure_password
  has_many :orders

  after_create :generate_token

  validates :name, :roles, presence: true
  validates :email, presence: true, uniqueness: true
  #TODO email verification

  def generate_token(test_token=nil)
    if test_token.present?
      if Rails.env.test?
        set_token test_token
      else
        puts "Can only set token in test ENV"
      end
    else
      set_token SecureRandom.base64(24)
    end
  end

  def token_expired?
    Time.now >= self.token_expiration
  end

  private

    def set_token token
      self.token = self.id.to_s + token
      self.token_expiration = Time.now + 1.day
      save
    end
end