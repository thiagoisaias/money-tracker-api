class Api::V1::CategoriesController < ApplicationController
  before_action :authenticate_api_v1_user!
  before_action :set_category, only: %i[show update destroy]
  before_action :set_user, only: %i[index create]


  def index
    @categories = @user.categories.page params[:page]
    render json: @categories, status: :ok
  end

  def show
    render json: @category, status: :ok
  end

  def create
    @category = @user.categories.new(category_params)
    if @category.save
      render json: @category, status: :ok
    else
      render json: { errors: @category.errors }, status: :unprocessable_entity
    end
  end

  def update
    if @category.update(category_params)
      render json: @category, status: :ok
    else
      render json: { errors: @category.errors }, status: :unprocessable_entity
    end
  end

  def destroy
    @category.destroy
    render json: {}, status: :no_content
  end

  private
  
  def set_category
    @category = Category.find(params[:id])
  end

  def set_user
    @user = User.find(params[:user_id])
  end

  def category_params
    params.require(:category).permit(:name, :color)
  end
end
