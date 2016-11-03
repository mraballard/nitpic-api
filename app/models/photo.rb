class Photo < ApplicationRecord

  belongs_to :user
  belongs_to :album

  belongs_to :album, dependent: :destroy
  has_many :comments

end
