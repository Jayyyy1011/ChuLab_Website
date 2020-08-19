class Chemical < ApplicationRecord

  validates :name, :formula, :package, :company, :agent, :storage_place, :remain, presence: true

  belongs_to :user

  scope :recent_update, -> { order("updated_at DESC") }
end
