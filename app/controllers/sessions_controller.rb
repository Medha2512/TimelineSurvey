class SessionsController < ApplicationController

  before_filter :authenticate_user, :except => [:index, :login, :login_attempt, :logout]
  before_filter :save_login_state, :only => [:index, :login, :login_attempt]
  before_filter :current_user, :only => [:index, :login, :login_attempt]

  helper_method :destroyItem
  def login_attempt
    authorized_user = User.authenticate(params[:username_or_email],params[:login_password])
    if authorized_user
      if params[:remember_me]
        cookies.permanent[:auth_token] = authorized_user.auth_token
      else
        cookies[:auth_token] = authorized_user.auth_token
      end
      flash[:notice] = ""
      redirect_to(:action => authorized_user.current_page)
    else
      flash[:notice] = "Invalid Username or Password"
      flash[:color] = "invalid"
      render "login"
    end
  end

  def consent
    #Consent Form Page
  end

  def profile
    #Profile Page
  end

  def setting
    #Setting Page
  end

  def login
    #Login Form
  end

  def likertItems
    @user = current_user
    @user.update_attributes(:current_page => 'likertItems')
  #Login Form
  end

  def ed_experience
    #Login Form
  end

  def admin_page
    @users = User.all
  end

  def ed_exp_response
    @user = current_user
    @ed_exp = @user.build_ed_exp_classification(ed_exp_response_params)
    if @ed_exp.save
      @user.update_attributes(:current_page => 'thank_you')
      flash[:notice] = "You have successfully completed the survey."
      flash[:color]= "valid"
      redirect_to(:action => 'thank_you')
    else
      flash[:notice] = "Some error"
      flash[:color]= "invalid"
      render "ed_experience"
    end
  end

  def thank_you

  end

  def likert_response
    @user = current_user
    @likert = @user.build_like_rt_response(likert_response_params)

    if @likert.save
      @user.update_attributes(:current_page => 'ed_experience')
      flash[:notice] = "LikeRT event logged"
      flash[:color]= "valid"
    else
      flash[:notice] = "LikeRT event incorrect"
      flash[:color]= "invalid"
    end
    render "ed_experience"
  end

  def trigger_startdate
    @user = current_user
    @undergrad_date = convert_date(params[:user], :undergrad_end)
    @user.update_attributes( :undergrad_end => @undergrad_date, :current_page => 'setting', :event_count => 1)
    redirect_to :action => 'setting'
  end

  def consent_decision
    if params[:decision] == 'accept'
      @user = current_user
      @user.update_attributes(:accepted => true, :current_page => 'profile')
      redirect_to(:action => 'profile')
    elsif params[:decision] == 'decline'
      flash[:color] = "invalid"
      flash[:notice] = "Thanks for visiting!!!"
      redirect_to(:action => 'logout')
    end
  end

  def logout
    cookies.delete(:auth_token)
    redirect_to :action => 'login'
  end

  def delete
    @user = current_user
    cookies.delete(:auth_token)
    if @user.destroy
      flash[:color] = "valid"
      flash[:notice] = "Profile successfully deleted"
      redirect_to :action => 'login'
    end
  end

  def destroyItem
    @item = params[:item]
    Careertransition.delete_all(["event_time = ? AND new_career_field = ?", @item[:start], @item[:content]])
    render :json => { :success => "success", :status_code => "200" }
  end

  private

  def convert_date(hash, date_symbol_or_string)
    attribute = date_symbol_or_string.to_s
    return Date.new(hash[attribute + '(1i)'].to_i, hash[attribute + '(2i)'].to_i, hash[attribute + '(3i)'].to_i)
  end

  def likert_response_params
    params.require(:like_rt_response).permit(:question1, :question2, :question3, :question4,
    :question5, :question6, :question7, :question8, :question9, :question10, :question11,
    :question12)
  end

  def ed_exp_response_params
    params.require(:ed_exp_classification).permit(:service, :no_of_engg_service,
    :participate_as , :travel, :travel_type, :travel_term, :formal_leadership, :service_period,
    :engg_beneficial_experience, :non_engg_service, :nonengg_beneficial_experience,
    :service_exp => [], :non_engg_ser_exp => [])
  end

end