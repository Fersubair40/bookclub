class User < ApplicationRecord
  has_secure_password

  include LockableAuth
  #
  # Number of authentication tries before locking an account.
  User.maximum_attempts = 3 # Default 5. Disable lock when this parameter is 0

  # Time interval to unlock the account
  User.unlock_in = 30.minutes # Default 1 hour. Disable lock when this parameter is 0

  validates :email, presence: true, uniqueness: true
  validates_format_of :email, with:  /@/
  validates :password_digest, presence: true
  validates :username, presence: true, uniqueness: true

  has_many :comments
  has_many :ratings
end
