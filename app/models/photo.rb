class Photo < ApplicationRecord
  belongs_to :album, dependent: :destroy
  has_many :comments
  has_attached_file :image, styles: {
    large: '600x600>',
    medium: '300x300>',
    thumb: '200x200#',
    square: '200x200#'
  }

  # Validate the attached image is image/jpg, image/png, etc
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
end
