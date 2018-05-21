class Api::V1::CategoriesController < ApplicationController
  # before_action :authenticate_api_v1_user!

  def index
    @categories = Category.all.page params[:page]
    render json: @categories, status: :ok
  end

  def show
    @category = Category.find(params[:id])
    render json: @category, status: :ok
  end

  def destroy
    @category = Category.find(params[:id])
    @category.destroy
    render json: {}, status: :no_content
  end

  private

  def category_params
    params.require(:category).permit(:name, :initial_balance)
  end
end
