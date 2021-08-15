class User < ApplicationRecord
  has_secure_password
  validates :name, :email, presence: true
  validates :name, :email, uniqueness: true
  validates :name, length: { minimum: 6 }

  has_many :characters


end
