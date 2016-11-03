class Album < ApplicationRecord
  belongs_to :user, dependent: :destroy
  has_many :photos
end
