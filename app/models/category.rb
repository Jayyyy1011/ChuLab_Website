class Category < ApplicationRecord

  has_many :optical_elements

  validates :name, presence: true


end
