class Account < ApplicationRecord
  belongs_to :user
  has_many :transactions, dependent: :destroy

  validates :name, presence: true
  validates :initial_balance, presence: true

  def current_balance
    income = transactions.where(transaction_type: 0).sum(:value)
    outcome = transactions.where(transaction_type: 1).sum(:value)
    result = (initial_balance + income - outcome)
  end
end
