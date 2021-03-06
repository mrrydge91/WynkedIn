class UsersController < ApplicationController
	def show
    @user = User.find(params[:id])
    @user_name = User.find(params[:name])
  end

  def new
  	 @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
    	flash[:success] = "Welcome to WynkedIn!"
      redirect_to @user.profile
    else
      render 'new'
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password,
                                 :password_confirmation)
  end
end
