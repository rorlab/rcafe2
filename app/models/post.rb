class Post < ApplicationRecord
  belongs_to :bulletin, optional: true
  mount_uploader :picture, PictureUploader
end
