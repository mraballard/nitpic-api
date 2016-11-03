class User < ApplicationRecord

    validates :username, presence: true, uniqueness: true
    has_many :photos, dependent: :destroy
    has_many :albums, through: :photos

  has_many :albums
  validates :username, presence: true, uniqueness: true
  has_secure_password

end
