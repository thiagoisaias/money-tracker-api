class Api::V1::UsersController < ApplicationController
  before_action :authenticate_api_v1_user!, only: %i[show overall_balance]
  before_action :set_user, only: %i[show overall_balance fetch_transactions_by_date]

  def show
    render json: @user, status: :ok
  end

  def overall_balance
    @overall_balance = @user.overall_balance
    render json: { overall_balance:  @overall_balance }, status: :ok
  end

  def fetch_transactions_by_date
    @transactions = Transaction.where(account: @user.accounts).where(
      "extract(year from date) = ? AND extract(month from date) = ?", params[:year], params[:month]
    ).order(:date, :id).page params[:page]
    
    render json: @transactions, status: :ok
  end

  private

  def set_user
    @user = User.find(params[:id])
  end
end
