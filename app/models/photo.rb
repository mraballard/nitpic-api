class Photo < ApplicationRecord
  belongs_to :album, dependent: :destroy
  has_many :comments
end
