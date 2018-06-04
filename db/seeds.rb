# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user = User.create(name: 'Thiago', email: 'thiago@email.com', password: 'q1w2e3r4')

category = user.categories.create(name: 'Health', color: '#01AABB')
user.categories.create(name: 'Food', color: '#88FF99')
user.categories.create(name: 'Home', color: '#CCFF99')
user.categories.create(name: 'Transport', color: '#FF33AA')

account = user.accounts.create(name: 'Account 1', initial_balance: 827346.65, user_id: User.first.id)
user.accounts.create(name: 'Account 2', initial_balance: 347346.65, user_id: User.first.id)
user.accounts.create(name: 'Account 3', initial_balance: 7346.65, user_id: User.first.id)
user.accounts.create(name: 'Account 4', initial_balance: 46.65, user_id: User.first.id)
user.accounts.create(name: 'Account 5', initial_balance: 999346.65, user_id: User.first.id)

30.times do
  Transaction.create(
    description: Faker::SiliconValley.invention,
    date: Faker::Date.backward(14),
    value: Faker::Number.decimal(4),
    status: 1,
    transaction_type: 1,
    account_id: account.id,
    category_id: category.id
  )
end