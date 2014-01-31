class UsersController < ApplicationController
  before_action :admin_user, only: :promote
  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
  end

  def index
    @users = User.all
  end

  def create
    @user = User.new(user_params)

    if @user.save
      flash[:success] = (t :welcome_new_user)
      sign_in @user
      redirect_to root_url
    else
      render 'new'
    end

  end

  def promote
    @user = User.find(params[:id])
    if valid_types.include?(user_type)
      @user.disable_password_validation
      @user.update_attributes!(type: user_type)
    end
    index
    render 'index'
  end

  private
    def user_params
      params.require(:user).permit(:first_name,:last_name,:email,:password,:password_confirmation)
    end

    def user_type
      params.require(:type)
    end

    def valid_types
      ['Admin', 'Keeper', 'Player', 'Referee', 'Accountant']
    end

    def admin_user
      redirect_to(root_url) unless admin?
    end

end
