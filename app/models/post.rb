class Post < ApplicationRecord
  mount_uploader :picture, PictureUploader
  acts_as_taggable
  belongs_to :bulletin, optional: true
  has_many :comments, dependent: :destroy

  def tag_list_fixed
    tag_list.to_s
  end

  def tag_list_fixed=(tag_list_string)
    self.tag_list = tag_list_string
  end

end
