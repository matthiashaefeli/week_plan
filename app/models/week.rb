class Week < ApplicationRecord
  serialize :grocery, Hash
  has_and_belongs_to_many :my_meals
  belongs_to :user
end
