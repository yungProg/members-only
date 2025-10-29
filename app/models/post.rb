class Post < ApplicationRecord
  validates :content, presence: true
  validates :member_id, presence: true
  belongs_to :member
end
