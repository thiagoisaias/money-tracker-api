class AccountSerializer < ActiveModel::Serializer
  attributes :id, :name
  attribute :initial_balance, key: :initialBalance
end
