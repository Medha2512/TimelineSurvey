class EducationtransitionsController < ApplicationController
  before_filter :current_user , :only => [:new, :create]
  def new
    @user = current_user
    @education = @user.educationtransitions.build
  end

  def create
    if params[:submit]
      @user = current_user
      @education = @user.educationtransitions.build(education_params)
      @education.content = set_education_content(@education.new_education_field)
      if not @education.save
        flash[:notice] = "Error : " + @education.errors.full_messages.join(",") + " for that date"
        flash[:color]= "invalid"
      end
    end
    redirect_to(:controller => 'sessions', :action => 'timeline')

  end

  private

  def education_params
    params.require(:educationtransition).permit(:new_education_field, :motivation,
    :eng_service_through_program, :eng_service_through_extra, :education_service_satisfaction,
    :initial_new_education_service_satisfaction, :previous_dissatisfaction,
    :ed_other_dissatisfaction_source, :event_time, :dissatisfaction_source => [])
  end

  def set_education_content(new_education_field)
    if new_education_field == "MS in an engineering related field"
      return "Engr: MS"
    elsif new_education_field == "PhD in an engineering related field"
      return "Engr: PhD"
    elsif new_education_field == "BS/MS/PhD in non engineering related field"
      return "Non-Engr"
    end
  end
end
