class Category < ApplicationRecord
  belongs_to :user
  has_many :transactions

  validates :name, presence: true
  validates :color, presence: true
end
