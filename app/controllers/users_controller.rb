class UsersController < ApplicationController
  def index
    @users = User.paginate(page: params[:page], per_page: 5)
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new user_params
    if @user.save
      flash[:success] = "Hello #{@user.name}! Welcome to blog system!"
      redirect_to @user
    else
      render "new"
    end
  end

  def show
    if User.exists?(params[:id])
      @user = User.find params[:id]
    else
      flash[:danger] = "Could not found this user"
      redirect_to root_path
    end
  end

  private
  def user_params
    params.require(:user)
      .permit :name, :email, :password, :password_confirmation
  end
end
