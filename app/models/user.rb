class User < ActiveRecord::Base
  has_secure_password

  validates :name, :roles, presence: true
  validates :email, presence: true, uniqueness: true
  #TODO email verification
end