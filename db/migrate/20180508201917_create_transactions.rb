class CreateTransactions < ActiveRecord::Migration[5.2]
  def change
    create_table :transactions do |t|
      t.string :description
      t.date :date
      t.decimal :value, precision: 15, scale: 2
      t.integer :transaction_type
      t.integer :status
      t.references :account
      t.references :category
      t.timestamps
    end
  end
end
