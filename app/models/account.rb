# t.string "initial_balance"
# t.string "name"
# t.bigint "user_id"

class Account < ApplicationRecord
  belongs_to :user

  validates :name, presence: true
  validates :initial_balance, presence: true
end
