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
      flash[:notice] = "Password reset has expired. Please try again"
      flash[:color] = "invalid"      
      redirect_to new_password_reset_path
    elsif @user.update_attributes(password_params)    
      flash[:notice] = "Password has been reset!"
      flash[:color] = "valid"
      redirect_to root_url
    else
      render :edit
    end
  end

  def password_params
    params.require(:user).permit(:password)
  end

end