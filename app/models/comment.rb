class Comment < ApplicationRecord

  belongs_to :photo, dependent: :destroy

end
