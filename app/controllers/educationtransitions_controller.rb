class EducationtransitionsController < ApplicationController
  before_filter :current_user , :only => [:new, :create]

  def new    
    @user = current_user
    @education = @user.educationtransitions.build
  end

  def create
    @user = current_user
    @education = @user.educationtransitions.build(education_params)
    @count = @user.event_count + 1
    @user.update_attributes(:event_count => @count)
    if @education.save
      flash[:notice] = "Education event logged"
      flash[:color]= "valid"
    else
      flash[:notice] = "Education event incorrect"
      flash[:color]= "invalid"
    end
    redirect_to(:controller => 'sessions', :action => 'setting')

  end

  private
  def education_params
    params.require(:educationtransition).permit(:new_education_field, :motivation, :eng_service_through_program,
    :eng_service_through_extra, :education_service_satisfaction, :initial_new_education_service_satisfaction,
    :previous_dissatisfaction, :dissatisfaction_source, :created_at, :updated_at)
  end

end
