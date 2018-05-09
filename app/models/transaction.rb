class Transaction < ApplicationRecord
  enum transaction_type: %i[earning expense]
  enum status: %i[paid unpaid]
  
  belongs_to :account
  belongs_to :category

  validates :description, presence: true
  validates :date, presence: true
  validates :value, presence: true
  validates :transaction_type, presence: true
end
