class User < ApplicationRecord
  has_many :albums, dependent: :destroy
  has_many :comments
  validates :username, presence: true, uniqueness: true
  has_secure_password
end
