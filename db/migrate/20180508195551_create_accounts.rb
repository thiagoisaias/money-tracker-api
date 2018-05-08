class CreateAccounts < ActiveRecord::Migration[5.2]
  def change
    create_table :accounts do |t|
      t.decimal :initial_balance, precision: 15, scale: 2
      t.string :name
      t.references :user
      t.timestamps
    end
  end
end
