class UsersController < ApplicationController

  def register
    @user = User.new(user_params)
    if @user.save
      token = JWT.encode({user_id: @user.id}, Rails.application.secrets.secret_key_base)
      render json: {token: token, message: "User Created"}, status: :created
    else
      render json: @user.errors
    end
  end

  def login
    user = User.find_by(email: user_params[:email])
    if user 
      if user.authenticate(user_params[:password])
        token = JWT.encode({user_id: user.id}, Rails.application.secrets.secret_key_base)
        render json: {message: "User Login Successful", token: token}
      else
        render json: {errors: "Invalid Credentials"}
      end
    else
      render json: {errors: "User not Found"}
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password)
  end
end
