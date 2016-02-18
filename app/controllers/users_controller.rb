class UsersController < ApiBaseController
  def index
    @users = User.all
    render json: @users
  end

  def create
    @user = User.new user_params
    sign_in @user

    if @user.save!
      render json: @user
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

  private

    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
end