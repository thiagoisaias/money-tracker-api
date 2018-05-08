# t.string "description"
# t.date "date"
# t.string "value"
# t.integer "transaction_type"
# t.integer "status"
# t.bigint "account_id"
# t.bigint "category_id"

class Transaction < ApplicationRecord
  belongs_to :account
  belongs_to :category
  enum transaction_type: %i[earning expense]
  enum status: %i[paid unpaid]

  validates :description, presence: true
  validates :date, presence: true
  validates :value, presence: true
  validates :transaction_type, presence: true
  validates :status, presence: true
end
