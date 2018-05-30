class Api::V1::TransactionsController < ApplicationController
  before_action :authenticate_api_v1_user!
  before_action :set_transaction, only: %i[show update destroy]
  before_action :set_account, only: %i[index create]

  def index
    @transactions = @account.transactions.page params[:page]
    render json: @transactions, status: :ok
  end

  def show
    render json: @transaction, status: :ok
  end

  def create
    @transaction = @account.transactions.new(transaction_params)
    if @transaction.save
      render json: @transaction, status: :ok
    else
      render json: { errors: @transaction.errors }, status: :unprocessable_entity
    end
  end

  def update
    if @transaction.update(transaction_params)
      render json: @transaction, status: :ok
    else
      render json: { errors: @transaction.errors }, status: :unprocessable_entity
    end
  end

  def destroy
    @transaction.destroy
    render json: {}, status: :no_content
  end

  private

  def set_transaction
    @transaction = Transaction.find(params[:id])
  end

  def set_account
    @account = Account.find(params[:account_id])
  end

  def transaction_params
    params.require(:transaction).permit(
      :description,
      :date,
      :value,
      :transaction_type,
      :status,
      :category_id,
      :account_id
    )
  end
end
