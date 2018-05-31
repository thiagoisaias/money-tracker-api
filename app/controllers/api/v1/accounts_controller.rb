class Api::V1::AccountsController < ApplicationController
  before_action :authenticate_api_v1_user!
  before_action :set_account, only: %i[show update destroy current_balance]
  before_action :set_user, only: %i[index create]

  def index
    @accounts = @user.accounts.page params[:page]
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

  def destroy
    @account.destroy
    render json: {}, status: :no_content
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
