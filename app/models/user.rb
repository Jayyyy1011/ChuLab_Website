class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :posts
  has_many :chemicals
  has_many :optical_elements

  has_many :collects
  has_many :collected_posts, :through => :collects, :source => :post

  def is_fan_of?(post)
    collected_posts.include?(post)
  end

  def admin?
    is_admin
  end

end
