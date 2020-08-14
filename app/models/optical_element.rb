class OpticalElement < ApplicationRecord

  belongs_to :category

  validates :item_number, :bandwidth, presence: true

end
