class User < ApplicationRecord
  has_secure_password
  validates :email, presence: true, uniqueness: true
  validates_format_of :email, :with => /@/
  validates :user_name, presence: true, uniqueness: true
  validates :password, presence: true, length: { within: 4..40 }
  has_many :likes
  has_many :meals
end
