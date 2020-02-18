class ProductsController < ApplicationController
  def index                                                                     
    if params[:category].present?
      category = params[:category]
      @products = Product.joins(:category).where(categories: {name: "#{category}"})
    else
      @products = Product.all                                                     
    end
    render json: @products
  end                                                                           

  def create
    @product = Product.new(product_params)
    if @product.save
      render json: @product, status: :created
    else
      render json: {errors: @product.errors.full_messages}
    end
  end
                                                          
  private
  def product_params
    params.require(:product).permit(:name, :description, :price, :make, :category_id)
  end
end
