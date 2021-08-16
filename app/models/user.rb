class User < ApplicationRecord
  has_secure_password
  validates :email, presence: true
  validates :email, uniqueness: true
  validates :name, length: { minimum: 2 }

  has_many :characters


end
