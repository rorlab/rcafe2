class Post < ApplicationRecord
  mount_uploader :picture, PictureUploader
  belongs_to :bulletin, optional: true
  has_many :comments, dependent: :destroy
end
