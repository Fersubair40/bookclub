class Api::V1::AuthenticateController < ApplicationController
  def create
    @user = User.find_by_username(user_params[:username])
    if @user&.authenticate(user_params[:password])
      render json: {
        id: @user.id,
        token: JsonWebToken.encode(user_id: @user.id)
      }, status: :ok
    elsif @user.failed_attempts >= 3
      render json: {message: "Account has been locked come back in 30 minutes"}, status: :locked
    else
        render json: {message: 'Invalid credentials or Not authorized'}, status: :unauthorized
    end
  end

  private
  def user_params
    params.require(:user).permit(:username, :password)
  end
end
