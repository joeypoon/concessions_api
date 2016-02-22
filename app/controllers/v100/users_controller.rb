class V100::UsersController < ApplicationController
  skip_before_action :authenticate_token, only: [:create, :login]

  def index
    @users = User.all
    render json: @users
  end

  def create
    @user = User.new user_params

    if @user.save!
      render json: { user: { id: @user.id, email: @user.email, token: @user.token } }
    else
      render json: { message: @user.errors }, status: 422
    end
  end

  def show
    @user = User.find params[:id]
    render json: @user
  end

  def orders
    @user = User.find params[:id]
    @orders = params[:active] ? @user.orders.active : @user.orders
    render json: @orders
  end

  def login
    @user = User.find_by_email user_params[:email]
    if @user.try(:authenticate, user_params[:password])
      @user.generate_token
      render json: { user: { token: @user.token } }
    else
      render json: { error: "Invalid email/password combination" }
    end
  end

  private

    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
end