class Api::V1::UsersController < ApplicationController
  before_action :authenticate_api_v1_user!, only: %i[show overall_balance]
  before_action :set_user, only: %i[show overall_balance]

  def show
    render json: @user, status: :ok
  end

  def overall_balance
    @overall_balance = @user.overall_balance
    render json: { overall_balance:  @overall_balance }, status: :ok
  end

  private

  def set_user
    @user = User.find(params[:id])
  end
end
