class Album < ApplicationRecord
  has_many :photos
  has_one :user, through: :photos
end
