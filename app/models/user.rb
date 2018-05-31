class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :trackable, :validatable
  include DeviseTokenAuth::Concerns::User
  has_many :accounts, dependent: :destroy
  has_many :categories, dependent: :destroy

  validates :name, presence: :true

  after_create :generate_default_categories
  after_create :generate_default_account


  def overall_balance
    account_balances = accounts.map{ |account| account.current_balance }
    account_balances.sum
  end

  private

  def generate_default_account
    self.accounts.create(name: "Default", initial_balance: 0)
  end

  def generate_default_categories
    category_list = [
      { name: "Bills & Utilities" , color: "red" },
      { name: "Education" , color: "pink" },
      { name: "Food" , color: "gray" },
      { name: "Healthcare" , color: "black" },
      { name: "Hobbies" , color: "yellow" },
      { name: "Home" , color: "lightgreen" },
      { name: "Kids" , color: "salmon" },
      { name: "Misc" , color: "blue" },
      { name: "Personal Care" , color: "lightblue" },
      { name: "Transport" , color: "purple" },
      { name: "Travel" , color: "orange" }
    ]

    category_list.each do |category|
      self.categories.create(name: category[:name], color: category[:color])
    end
  end
end
