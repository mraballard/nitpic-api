class Photo < ApplicationRecord
  belongs_to :album, dependent: :destroy
  has_many :comments
  has_attached_file :image, styles: {
    thumb: '200x200>',
    square: '200x200#',
    medium: '300x300>'
  }

  # Validate the attached image is image/jpg, image/png, etc
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
end
