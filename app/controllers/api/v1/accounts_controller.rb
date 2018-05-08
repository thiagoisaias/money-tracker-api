class Api::V1::AccountsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_account, only: %i[show update destroy current_balance]
  before_action :set_user, only: %i[index create]

  def index
    @accounts = @user.accounts
    render json: @accounts, status: :ok
  end

  def show
    render json: @account, status: :ok
  end

  def create
    @account = @user.accounts.new(account_params)
    if @account.save
      render json: @account, status: :ok
    else
      render json: { errors: @account.errors }, status: :unprocessable_entity
    end
  end

  def update
    if @account.update(account_params)
      render json: @account, status: :ok
    else
      render json: { errors: @account.errors }, status: :unprocessable_entity
    end
  end

  def current_balance
    income = @account.transactions.where(transaction_type: 1).sum(:value)
    outcome = @account.transactions.where(transaction_type: 2).sum(:value)
    result = (@account.initial_balance + income - outcome)
    if result
      render json: { current_balance: result }, status: :ok
    else 
      render json: { error: "Something went wrong" }, status: :unprocessable_entity
  end

  private

  def set_account
    @account = Account.find(params[:id])
  end

  def set_user
    @user = User.find(params[:user_id])
  end

  def account_params
    params.require(:account).permit(:name, :initial_balance)
  end
end
