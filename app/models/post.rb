class Post < ApplicationRecord
  belongs_to :bulletin, optional: true
end
