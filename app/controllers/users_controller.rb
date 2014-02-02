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

  def edit
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(user_params)

    if @user.save
      flash[:success] = (t :welcome_new_user)
      sign_in @user
      redirect_to root_path
    else
      render 'new'
    end
  end

  def update
    if @user = User.find(params[:id])
      @user.disable_password_validation
      if @user.update_attributes(user_params)
        flash[:notice] = (t :profile_updated)
        redirect_to user_path(@user)
      else
        render 'edit'
      end
    else
      redirect_to users_path
    end
  end

  def change_password
    if user = User.find(params[:id])
      user.reset_password
      redirect_to edit_password_reset_path(id: user.password_reset_token)
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
      params.require(:user).permit(:first_name,:last_name,:email,:password,:password_confirmation, :phone_number)
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
