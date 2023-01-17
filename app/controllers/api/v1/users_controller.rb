class Api::V1::UsersController < ApplicationController
  def create
    user = User.new(user_params)
    if user.save
      session[:user_id] = user.id
      render json: UserSerializer.new(user), status: 201
    else
      render json: ErrorSerializer.user_email_taken, status: 400
    end
  end

  private

  def user_params
    params.permit(:name, :email, :password, :password_confirmation)
  end
end