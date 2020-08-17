class Meeting < ApplicationRecord
  validates :date, :speaker, presence: true

  scope :date, -> { order("date ASC") }
end
