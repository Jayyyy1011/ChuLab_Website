class Post < ApplicationRecord

  belongs_to :user

  validates :content, presence: true

  scope :recent, -> { order("created_at DESC") }

end
