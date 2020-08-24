class Post < ApplicationRecord

  belongs_to :user

  has_many :collects
  has_many :collected_users, :through => :collects, :source => :user

  validates :title, presence: true
  validates :content, presence: true

  scope :recent, -> { order("id DESC") }

end
