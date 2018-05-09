class TransactionSerializer < ActiveModel::Serializer
  attributes :id, :description, :date, :value, :status
  attribute :transaction_type, key: :transactionType

  belongs_to :account
  belongs_to :category
end