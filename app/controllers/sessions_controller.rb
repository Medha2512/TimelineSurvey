class SessionsController < ApplicationController

  before_filter :authenticate_user, :except => [:index, :login, :login_attempt, :logout, :sign_in_guest]
  before_filter :save_login_state, :only => [:index, :login, :login_attempt]
  before_filter :current_user, :only => [:likertItems, :ed_exp_response, :likert_response,
    :trigger_startdate, :consent_decision]
  respond_to :html, :js
  helper_method :destroyItem
  def consent
    #Consent Form Page
  end

  def profile
    @user = current_user
  end

  def demographics  
    @user = current_user
    @demographic = @user.demographic
  end

  def timeline
    @educationtransition = Educationtransition.new
    @careertransition = Careertransition.new
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

    @ed_exp_classification = EdExpClassification.new
    @all_engg_service_exp = ["Engineers Without Borders, Engineers for a Sustainable World, Bridges 2 Prosperity or similar",
      "Extracurricular, Non-EWB-like (examples: unpaid student tutoring, K-12 outreach, etc.)",
      "Certificate Program (series of related classes, such as Engineering in Developing Communities)",
      "Service-Learning (in-class service experience tied to engineering content)",
      "Integrated Degree Program (engineering service was in many classes for your degree)",
      "Service provided through professional societies (ASME, ASCE, AAEE, IEEE, etc.)", "Unpaid Tutoring"]

    @all_non_engg_service_exp = ["Service-learning in Non-engineering courses",
      "Habitat for Humanity Build","Tutoring elementary or secondary children", "Donated Blood",
      "Disaster Relief Volunteer", "Short term on-site service project (i.e. 1-2 week service trip, Non-engineering)",
      "International Humanitarian Volunteer","Food Bank Volunteer","Meals on Wheels Volunteer",
      "Nursing Home Volunteer","Political Campaign Volunteer","Big Brother/Big Sister, Boys & Girls Club, Boy/Girl Scouts",
      "Soup Kitchen Volunteer","Sports Camp, Coaching, etc. (unpaid)"]
  end

  def thank_you
  end

  def admin_page
    @users = User.all
  end

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

  def sign_in_guest
    @user = User.new
    @username = "Guest" + User.count.to_s
    @user.username = @username
    @user.email = @username + "@def.com"
    @user.password = "abcdef"
    @user.is_admin = false
    @user.current_page = "consent"
    if @user.save
      cookies[:auth_token] = @user.auth_token
      flash[:notice] = "You have signed in as " + @user.username
      flash[:color] = "valid"
      redirect_to(:action => @user.current_page)
    else
      flash[:notice] = "Unable to get session."
      flash[:color] = "invalid"
      render "login"
    end
  end

  def ed_exp_response
    @user = current_user

    if params[:back]
      @user = current_user
      @like_rt_response = @user.like_rt_response
      render 'likertItems'
    else
      @ed_exp = @user.build_ed_exp_classification(ed_exp_response_params)
      if @ed_exp.save
        @user.update_attributes(:current_page => 'demographics')
        redirect_to(:action => 'demographics')
      else
        flash[:notice] = "Some error in the form"
        flash[:color]= "invalid"
        render "ed_experience"
      end
    end
  end

  def likert_response
    if params[:back]
      render 'timeline'
    else
      @user = current_user
      @likert = @user.build_like_rt_response(likert_response_params)
      if @likert.save
        @user.update_attributes(:current_page => 'ed_experience')
        redirect_to(:action => 'ed_experience')
      else
        flash[:notice] = "Some error in the form."
        flash[:color]= "invalid"
        render "likertItems"
      end
    end
  end

  def demographic_response
    @user = current_user
    if params[:back]
      @ed_exp_classification = @user.ed_exp_classification
      @all_engg_service_exp = ["Engineers Without Borders, Engineers for a Sustainable World, Bridges 2 Prosperity or similar",
      "Extracurricular, Non-EWB-like (examples: unpaid student tutoring, K-12 outreach, etc.)",
      "Certificate Program (series of related classes, such as Engineering in Developing Communities)",
      "Service-Learning (in-class service experience tied to engineering content)",
      "Integrated Degree Program (engineering service was in many classes for your degree)",
      "Service provided through professional societies (ASME, ASCE, AAEE, IEEE, etc.)",
      "Unpaid Tutoring"]

      @all_non_engg_service_exp = ["Service-learning in Non-engineering courses",
      "Habitat for Humanity Build","Tutoring elementary or secondary children", "Donated Blood",
      "Disaster Relief Volunteer", "Short term on-site service project (i.e. 1-2 week service trip, Non-engineering)",
      "International Humanitarian Volunteer","Food Bank Volunteer","Meals on Wheels Volunteer",
      "Nursing Home Volunteer","Political Campaign Volunteer","Big Brother/Big Sister, Boys & Girls Club, Boy/Girl Scouts",
      "Soup Kitchen Volunteer","Sports Camp, Coaching, etc. (unpaid)"]
      render "ed_experience"
    else
      @demographic = @user.build_demographic(demographic_params)
      if @demographic.save
        @user.update_attributes(:current_page => 'thank_you', :completed => true)
        redirect_to(:action => 'thank_you')
      else
        flash[:notice] = "Demographic event incorrect"
        flash[:color]= "invalid"
        render "demographics"
      end
    end
  end

  def trigger_startdate

    @user = current_user
    @user.update_attributes(profile_params)
    @user.update_attributes(:current_page => 'timeline')

    redirect_to(:action => 'timeline')

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

  def destroyItem
    @user = current_user
    @item = params[:item]
    if @item[:group] == "1"
      Careertransition.delete_all(["event_time = ? AND content = ? AND user_id = ?",
        @item[:start], @item[:content], @user.id])
    elsif @item[:group] == "2"
      Educationtransition.delete_all(["event_time = ? AND content = ? AND user_id = ?",
        @item[:start], @item[:content], @user.id])
    end
    render :json => { :success => "success", :status_code => "200" }
  end

  def moveItem
    @user = current_user
    @item = params[:item]
    @modified = params[:modified]
    @oldItemStart = params[:oldItemStart]
    
    if @item[:group] == "1"
      Careertransition.where({content: @item[:content] , event_time: @oldItemStart , user_id: @user.id}).first.update(event_time: @modified)
    elsif @item[:group] == "2"
      Educationtransition.where({content: @item[:content] , event_time: @oldItemStart , user_id: @user.id}).first.update(event_time: @modified)
    end
    render :json => { :success => "success", :status_code => "200" }
  end

  private

  def convert_date(hash, date_symbol_or_string)
    attribute = date_symbol_or_string.to_s
    return Date.new(hash[attribute + '(1i)'].to_i, hash[attribute + '(2i)'].to_i, hash[attribute + '(3i)'].to_i)
  end

  def profile_params
    params.require(:user).permit(:undergrad_major, :other_undergrad_major, :undergrad_end)
  end

  def likert_response_params
    params.require(:like_rt_response).permit(:conflicted_community, :helping_people,:technical_soln_impact,
    :service_not_part, :less_money_for_society, :unconnected, :incorporate_societal, :call_by_society,
    :pro_brono_work, :serve_others, :positive_volunteering , :extra_time)
  end

  def demographic_params
    params.require(:demographic).permit(:gender, :race, :other_race , :religious, :religious_active)
  end

  def ed_exp_response_params
    params.require(:ed_exp_classification).permit(:service_as_student, :no_of_engg_service,
    :participate_as , :travel, :travel_type, :travel_term, :formal_leadership, :engg_service_length,
    :engg_service_beneficial, :nonengg_service_as_student, :nonengg_service_beneficial, :other_service_exp,
    :other_non_engg_services, :engg_service_exp => [], :nonengg_service_exp => [])
  end

end