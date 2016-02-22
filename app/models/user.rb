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
        self.token = self.id.to_s + test_token
      else
        puts "Can only set token in test ENV"
      end
    else
      self.token = self.id.to_s + SecureRandom.base64(24)
    end
    save
  end
end