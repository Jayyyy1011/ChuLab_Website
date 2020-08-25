class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :posts, dependent: :destroy
  has_many :chemicals, dependent: :destroy
  has_many :optical_elements, dependent: :destroy

  has_many :collects, dependent: :destroy
  has_many :collected_posts, :through => :collects, :source => :post, dependent: :destroy

  scope :recent, -> { order("id DESC") }

  def is_fan_of?(post)
    collected_posts.include?(post)
  end

  def admin?
    is_admin
  end

end
