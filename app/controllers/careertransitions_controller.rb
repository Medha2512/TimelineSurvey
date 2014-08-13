class CareertransitionsController < ApplicationController
 before_filter :current_user , :only => [:new, :create]
 before_filter :set_career_content , :only => [:create]
 def new
  @user = current_user
  @career = @user.careertransitions.build
 end

 def create

  @user = current_user
  @career = @user.careertransitions.build(career_params)  
  @career.content = set_career_content
  if @career.save
   flash[:notice] = "Career event logged"
   flash[:color]= "valid"
  else
   flash[:notice] = "Career event incorrect"
   flash[:color]= "invalid"
  end
  redirect_to(:controller => 'sessions', :action => 'timeline')
 end

 private

 def career_params
  params.require(:careertransition).permit(:new_career_field, :event_time)
 end

 def set_career_content
  if params[:new_career_field] == "Consulting engineer in private industry"
   @new_career_field = "Private Engr"
  elsif params[:new_career_field] == "Engineering in the public sector"
   @new_career_field = "Public Engr"
  elsif params[:new_career_field] == "Engineering research lab"
   @new_career_field = "Engr Research"
  elsif params[:new_career_field] == "Non-engineering"
   @new_career_field = "Non Engr"
  elsif params[:new_career_field] == "Began my own engineering practice"
   @new_career_field = "Own Engr Firm"
  elsif params[:new_career_field] == "NGO/non-profit related to engineering"
   @new_career_field = "Engr NGO"
  elsif params[:new_career_field] == "Military"
   @new_career_field = "Military"
  elsif params[:new_career_field] == "Academic/education position related to engineering"
   @new_career_field = "Academic"
  elsif params[:new_career_field] == "Unemployed"
   @new_career_field = "Unemployed"
  elsif params[:new_career_field] ==  "Working at the same company, but moved from full time to part time/part time to full time"
   @new_career_field = "Same Co."
  elsif params[:new_career_field] ==  "Environmental"
   @new_career_field = "Environmental"
  elsif params[:new_career_field] == "Leaving work to take care of family"
   @new_career_field = "Left: for family"
  elsif params[:new_career_field] == "Leaving work for other reasons"
   @new_career_field = "Left: for other"
  end
 end
end
