class UsersController < ApplicationController
  before_filter :save_login_state, :only => [:new, :create]
  respond_to :xls, :html
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.username == 'abcAdmin'
      @user.is_admin = true
      @user.current_page = "admin_page"
    else
      @user.is_admin = false
      @user.current_page = "consent"
    end
    if @user.save
      if params[:remember_me]
        cookies.permanent[:auth_token] = @user.auth_token
      else
        cookies[:auth_token] = @user.auth_token
      end
      flash[:notice] = "You signed up successfully"
      flash[:color]= "valid"
      redirect_to(:controller => 'sessions', :action => @user.current_page)
    else
      flash[:notice] = "Form is invalid"
      flash[:color]= "invalid"
      render "new"
    end
  end

  def download_xls
    @user = User.find(params[:id])
    require 'spreadsheet'
    respond_to do |format|
      format.xls {
        users = Spreadsheet::Workbook.new
        list = users.create_worksheet :name => @user.username
        list.row(0).concat %w{Name Email Current_Page}
        list.row(1).push @user.username,@user.email,@user.current_page
        header_format = Spreadsheet::Format.new
        list.row(0).default_format = header_format
        spreadsheet = StringIO.new
        users.write spreadsheet
        send_data spreadsheet.string, :filename => @user.username + ".xls", :type =>  "application/vnd.ms-excel"

      }
    end
  end

  def delete
    @user = User.find(params[:id])
    if @user.destroy
      flash[:color] = "valid"
      flash[:notice] = "Profile successfully deleted"
      redirect_to :action => 'login'
    end
  end
  private

  def user_params
    params.require(:user).permit(:username, :email, :password)
  end
end
