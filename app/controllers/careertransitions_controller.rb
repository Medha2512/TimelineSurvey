class CareertransitionsController < ApplicationController
  before_filter :current_user , :only => [:new, :create]
  def new
    @user = current_user
    @career = @user.careertransitions.build
  end

  def create

    if params[:career_submit]
      @user = current_user
      @career = @user.careertransitions.build(career_params)
      @career.content = set_career_content(@career.new_career_field)

      if not @career.save
        flash[:notice] = "Error : " + @career.errors.full_messages.join(",") + " for that date"
        flash[:color]= "invalid"
      end
    end
    redirect_to(:controller => 'sessions', :action => 'timeline')

  end

  private

  def career_params
    params.require(:careertransition).permit(:new_career_field, :motivation, :service_through,
    :ways_service_through, :service_outside, :ways_service_outside,:job_length,
    :service_job_satisfaction, :initial_job_satisfaction, :previous_dissatisfaction,
    :other_dissatisfaction_source, :event_time, :dissatisfaction_source => [])
  end

  def set_career_content(new_career_field)
    if new_career_field == "Consulting engineer in private industry"
      return "Private Engr"
    elsif new_career_field == "Engineering in the public sector"
      return "Public Engr"
    elsif new_career_field == "Engineering research lab"
      return "Engr Research"
    elsif new_career_field == "Non-engineering"
      return "Non Engr"
    elsif new_career_field == "Began my own engineering practice"
      return "Own Engr Firm"
    elsif new_career_field == "NGO/non-profit related to engineering"
      return "Engr NGO"
    elsif new_career_field == "Military"
      return "Military"
    elsif new_career_field == "Academic/education position related to engineering"
      return "Academic"
    elsif new_career_field == "Unemployed"
      return "Unemployed"
    elsif new_career_field == "Same company, but full time to part time/part time to full time"
      return "Same Company"
    elsif new_career_field == "Environmental"
      return "Environmental"
    elsif new_career_field == "Leaving work to take care of family"
      return "Left: for family"
    elsif new_career_field == "Leaving work for other reasons"
      return "Left: for other"
    end
  end
end
