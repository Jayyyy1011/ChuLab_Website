class OpticalElement < ApplicationRecord

  belongs_to :category
  belongs_to :user

  validates :item_number, :bandwidth, presence: true

  scope :category_order, -> { order("category_id ASC") }

end
