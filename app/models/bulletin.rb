class Bulletin < ApplicationRecord
  has_many :posts, dependent: :destroy
end
