class Meal < ApplicationRecord
  has_and_belongs_to_many :week
  belongs_to :user
end
