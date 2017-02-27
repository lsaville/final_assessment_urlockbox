class User < ApplicationRecord
  has_secure_password

  validates :email, presence: :true
  validates :email, uniqueness: :true
  validates :password, presence: true
  validates_confirmation_of :password
end
