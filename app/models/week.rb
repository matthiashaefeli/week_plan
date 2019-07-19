class Week < ApplicationRecord
  has_and_belongs_to_many :meals
  belongs_to :user
end
