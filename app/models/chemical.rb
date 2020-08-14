class Chemical < ApplicationRecord

  validates :name, :formula, :package, :company, :agent, :storage_place, :remain, presence: true

end
