class UsersController < ApplicationController
  before_filter :save_login_state, :only => [:new, :create]
  respond_to :xls, :html
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.username == 'onlinecareersurvey'
      @user.is_admin = true
      @user.completed = true
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
    @users = User.all
    require 'spreadsheet'
    respond_to do |format|
      format.xls {
        users = Spreadsheet::Workbook.new
        list = users.create_worksheet :name => "User_Info"

        list.row(0).concat %w{Username Email Consent Completed Current_Page Undergrad_End Undergrad_Major
        Conflicted_community Helping_people Technical_soln_impact Service_not_part Less_money_for_society Unconnected
        Incorporate_societal Call_by_society pro_brono_work Serve_others Positive_volunteering Extra_time
        Service_as_student Separate_service_exp Engg_service_exp Other_service_exp Participate_as Travel Travel_type Travel_term
        Formal_leadership Engg_service_length Engg_service_beneficial Nonengg_service_as_student
        Nonengg_service_exp other_non_engg_services Nonengg_service_beneficial Gender Race Religious Religious_preference}

        @users.each.with_index(1) do |user, i|

          if not user.is_admin?
            list.row(i).push user.username, user.email, user.accepted, user.completed, user.current_page, user.undergrad_end, user.undergrad_major
            if not user.like_rt_response.nil?
            list.row(i).push user.like_rt_response.conflicted_community, user.like_rt_response.helping_people, user.like_rt_response.technical_soln_impact,
            user.like_rt_response.service_not_part, user.like_rt_response.less_money_for_society, user.like_rt_response.unconnected,
            user.like_rt_response.incorporate_societal , user.like_rt_response.call_by_society, user.like_rt_response.pro_brono_work,
            user.like_rt_response.serve_others , user.like_rt_response.positive_volunteering, user.like_rt_response.extra_time
            end
            if not user.ed_exp_classification.nil?
              list.row(i).push user.ed_exp_classification.service_as_student, user.ed_exp_classification.no_of_engg_service,
              user.ed_exp_classification.engg_service_exp.join(","), user.ed_exp_classification.other_service_exp,
              user.ed_exp_classification.participate_as, user.ed_exp_classification.travel, user.ed_exp_classification.travel_type,
              user.ed_exp_classification.travel_term, user.ed_exp_classification.formal_leadership,
              user.ed_exp_classification.engg_service_length, user.ed_exp_classification.engg_service_beneficial,
              user.ed_exp_classification.nonengg_service_as_student, user.ed_exp_classification.nonengg_service_exp.join(','),
            user.ed_exp_classification.other_non_engg_services, user.ed_exp_classification.nonengg_service_beneficial
            end
            if not user.demographic.nil?
            list.row(i).push user.demographic.gender, user.demographic.race, user.demographic.religious, user.demographic.religious_active
            end
          end
        end

        timelinelist = users.create_worksheet :name => "Timeline"

        timelinelist.row(0).concat %w{Username Email Consent Completed Current_Page}

        @users.each.with_index(1) do  |user, i|
          if not user.is_admin
            timelinelist.row(i).push user.username, user.email, user.accepted, user.completed, user.current_page
            if user.careertransitions.exists?
              timelinelist.row(0).concat %w{New_Career_Field Motivation Service_through Ways_service_through
              Service_outside Ways_service_outside Job_length Service_job_satisfaction Initial_job_satisfaction
              Previous_dissatisfaction Dissatisfaction_source Other_dissatisfaction_source Event_time}
              @careertransitions = user.careertransitions
              @careertransitions.each { |career|
                timelinelist.row(i).push career.new_career_field, career.motivation, career.service_through,
                career.ways_service_through, career.service_outside, career.ways_service_outside,
                career.job_length , career.service_job_satisfaction, career.initial_job_satisfaction,
                career.previous_dissatisfaction , career.dissatisfaction_source.join(","),
                career.other_dissatisfaction_source, career.event_time
              }
            end
          end
        end
        bg_color = Spreadsheet::Format.new({
          :weight => :bold,
          :pattern_fg_color => :grey
        })
        list.row(0).default_format = bg_color
        timelinelist.row(0).default_format = bg_color
        spreadsheet = StringIO.new
        users.write spreadsheet
        send_data spreadsheet.string, :filename =>  "SurveyRecords.xls", :type =>  "application/vnd.ms-excel"
      }
    end
  end

  def delete
    @user = User.find(params[:id])
    if @user.destroy
      flash[:color] = "valid"
      flash[:notice] = "Profile successfully deleted"
    else
      flash[:color] = "invalid"
      flash[:notice] = "Profile not deleted"
    end
    redirect_to(:controller => 'sessions', :action => 'admin_page')
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password)
  end
end
