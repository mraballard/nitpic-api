class Album < ApplicationRecord

  has_many :photos
  has_one :user, through: :photos

  belongs_to :user, dependent: :destroy
  has_many :photos

end
