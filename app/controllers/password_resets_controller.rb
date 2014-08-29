class PasswordResetsController < ApplicationController
  def create
    user = User.find_by(username: params[:username], email: params[:email])
    if user
      user.send_password_reset
      flash[:notice] = "Email sent with password reset instructions"
      flash[:color] = "valid"
      redirect_to root_url
    else
      flash[:notice] = "Invalid!!! Please re-enter your details."
      flash[:color] = "invalid"
      render :new
    end
  end

  def edit
    @user = User.find_by_password_reset_token!(params[:id])
  end

  def update
    @user = User.find_by_password_reset_token!(params[:id])
    if @user.password_reset_sent_at < 2.hours.ago
      redirect_to new_password_reset_path, :alert => "Password reset has expired."
    elsif @user.update_attributes(password_params)
      redirect_to root_url, :notice => "Password has been reset!"
    else
      render :edit
    end
  end

  def password_params
    params.require(:user).permit(:password)
  end

end