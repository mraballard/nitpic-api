class Album < ApplicationRecord
  belongs_to :user
  has_many :photos, dependent: :destroy

  def get_photos_data
    # needs photos id and url thumb
    photos.map {|photo|
      photo = {
        id: photo.id,
        title: photo.title,
        image_file_name: photo.image_file_name,
        image_thumb_url: photo.image.url(:thumb)
      }
    }
  end
end
