class EducationtransitionsController < ApplicationController
  before_filter :current_user , :only => [:new, :create]
  def new
    @user = current_user
    @education = @user.educationtransitions.build
  end

  def create
    @user = current_user
    @education = @user.educationtransitions.build(education_params)
    @education.content = set_education_content()
    if @education.save
      flash[:notice] = "Education event logged"
      flash[:color]= "valid"
    else
      flash[:notice] = "Education event incorrect"
      flash[:color]= "invalid"
    end
    redirect_to(:controller => 'sessions', :action => 'timeline')

  end

  private

  def education_params
    params.require(:educationtransition).permit(:new_education_field, :motivation, :eng_service_through_program,
    :eng_service_through_extra, :education_service_satisfaction, :initial_new_education_service_satisfaction,
    :previous_dissatisfaction, :dissatisfaction_source, :created_at, :updated_at)
  end

  def set_education_content
    @new_education_field = params[:new_education_field]
    if @new_education_field == "MS in an engineering field"
      return "Engr: MS"
    elsif     @new_education_field == "PhD in an engineering field"
      return "Engr: PhD"
    elsif     @new_education_field == "BS/MS/PhD in non engineering field"
      return "Non-Engr"
    end
  end
end
