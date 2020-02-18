class CartsController < ApplicationController
  before_action :authenticate_user!, only: [:update]
  
  def show
    @cart = Cart.where(user_id: params[:user_id]).first
    if @cart.present? && @cart.products.present?  
      render json: @cart.products
    else
      render json: {message: "No Products in User Cart"}
    end
  end

  def update
    if params[:user_id].to_i == @current_user.id
      @cart = Cart.find_or_create_by(user_id: @current_user.id)
      product = Product.where(id: params[:product_id]).first
      if product.present?
        if @cart.products.include?(product)
          render json: {message: "Product Already Present in Cart"} 
        else
          @cart.products << product
          render json: {message: "Product Added"}
        end
      elsif !product.present?
        render json: {errors: "Product id-#{params[:product_id]} not found"}
      elsif 
        render json: {errors: @cart.errors.full_messages}
      end
    else
      render json: {message: "User id passed and user associated with User Token does not match"}
    end
  end

end
