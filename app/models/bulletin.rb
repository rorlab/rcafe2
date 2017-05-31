class Bulletin < ApplicationRecord
  has_many :posts, dependent: :destroy
  as_enum :post_type, bulletin: 0, blog: 1, gallery: 2, news: 3
end
