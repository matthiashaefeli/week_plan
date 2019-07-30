class User < ApplicationRecord
  has_secure_password

  validates :email, presence: true, uniqueness: true
  validates_format_of :email, :with => /@/
  validates :user_name, presence: true, uniqueness: true
  validates :password, presence: true, length: { within: 4..40 }, if: :password

  before_save :downcase_fields

  has_many :likes
  has_many :meals

  def downcase_fields
    self.email.downcase!
  end
end
