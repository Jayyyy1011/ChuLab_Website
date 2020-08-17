class OpticalElement < ApplicationRecord

  belongs_to :category
  belongs_to :user

  validates :item_number, :bandwidth, presence: true

end
