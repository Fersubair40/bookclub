class Api::V1::UsersController < ApplicationController
  before_action :set_user, only: [:show]
  before_action :authenticate, only: [:signed_in]

  def create
    @user = User.new(user_params)
    if @user.save
      render json: {message: 'success'}, status: :created
      else
        render json: {message: @user.errors}, status: :unprocessable_entity
    end
  end

  def signed_in
    render json: {message: true, user_id: current_user.id}, status: :ok
  end

  def show
    render json: UserSerializer.new(@user).serializable_hash.to_json
  end

  private
  def user_params
    params.require(:user).permit(:email, :password, :username)
  end
  def set_user
    @user = User.find(params[:id])
  end
end
