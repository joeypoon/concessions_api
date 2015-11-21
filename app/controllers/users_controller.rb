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
      render json: { message: "Failed" }, status: 422
    end
  end

  private

    def user_params
      params.require(:user).permit(:name, :email, :password, :password_digest)
    end
end
