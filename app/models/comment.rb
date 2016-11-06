class Comment < ApplicationRecord
  belongs_to :photo
  validates :username, :user_id, presence: true
end
