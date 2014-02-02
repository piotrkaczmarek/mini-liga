class PasswordResetsController < ApplicationController

  def create
    user = User.find_by_email(params[:email])
    if user
      user.send_password_reset
      flash[:notice] = (t :password_reset_sent)
    else
      flash[:error] = (t :no_such_email)
    end
    redirect_to root_url 
  end

  def edit
    @user = User.find_by_password_reset_token!(params[:id])
  end

  def update
    if @user = User.find_by_password_reset_token(params[:id])
      if @user.password_reset_sent_at < 2.hours.ago
        flash[:error] = (t :password_expired)
        redirect_to new_password_reset_path
      elsif @user.update_attributes(user_params)
        flash[:notice] = (t :password_reseted)
        redirect_to root_url
      else
        render :edit
      end   
    else
      redirect_to root_url
    end
  end

  private

    def user_params
      params.require(:user).permit(:password, :password_confirmation)
    end

end
