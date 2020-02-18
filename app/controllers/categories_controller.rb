class CategoriesController < ApplicationController
  def index
    @categories =  Category.all
    render json: @categories, status: 200
  end
  
  def create
    @category = Category.new(category_params)
    if @category.save
      render json: @category, status: :created
    else
      render json: {errors: @category.errors.full_messages}
    end
  end

  private

  def category_params
    params.require(:category).permit(:name, :type,:model)
  end
end
