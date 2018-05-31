class AccountSerializer < ActiveModel::Serializer
  attributes :id, :name, :initial_balance, :current_balance
end
