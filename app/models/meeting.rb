class Meeting < ApplicationRecord
  validates :date, :speaker, presence: true
end
