class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :trackable, :validatable
  include DeviseTokenAuth::Concerns::User
  has_many :accounts
  has_many :categories

  after_create :generate_default_categories
  after_create :generate_default_account

  private

  def generate_default_account
    self.accounts.create(name: "Default", initial_balance: 0)
  end

  def generate_default_categories
  end
end
