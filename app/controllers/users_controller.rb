class UsersController < ApplicationController
  before_action :signed_in_user, only: [:edit, :update]
  before_action :correct_user,   only: [:edit, :update]

	def index
    @users = User.all
  end

  def show
		@user = User.find(params[:id])
	end

  def new
  	@user = User.new
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:success] = "Profile updated"
      redirect_to @user
    else
      render 'edit'
    end
  end

  def create
    @user = User.new(user_params)
    if @user.save
      sign_in @user
      flash[:success] = "Welcome to the Sample App!"
      redirect_to @user
    else
      render 'new'
    end
  end

  def check_signup_username
    response = User.check_signup_username(params[:username])

    respond_to do |format|
      format.json  { render :json => response }
    end
  end

  def check_signup_email
    response = User.check_signup_email(params[:email])

    respond_to do |format|
      format.json  { render :json => response }
    end
  end

  def check_signup_pw
    response = User.check_signup_pw(params[:signup_pw])

    respond_to do |format|
      format.json  { render :json => response }
    end
  end

  def check_signup_pw_confirmation
    response = User.check_signup_pw_confirmation(params[:username])

    respond_to do |format|
      format.json  { render :json => response }
    end
  end

  private

    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end

    # Before filters

    def signed_in_user
      unless signed_in?
        store_location
        redirect_to signin_url, notice: "Please sign in."
      end
    end

    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless current_user?(@user)
    end
end