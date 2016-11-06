class Photo < ApplicationRecord
  belongs_to :album
  has_many :comments, dependent: :destroy
  has_attached_file :image, styles: {
    large: '600x600>',
    medium: '300x300>',
    thumb: '200x200>',
    square: '200x200#'
  }

  def get_image_properties
    
  end

  # Validate the attached image is image/jpg, image/png, etc
  validates_attachment_content_type :image, :content_type => /^image\/(png|gif|jpeg)/
end
