class Category < ApplicationRecord
  has_many :transactions

  validates :name, presence: true
  validates :color, presence: true
end
