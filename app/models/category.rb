class Category < ApplicationRecord

  has_many :optical_elements, dependent: :destroy

  validates :name, presence: true


end
