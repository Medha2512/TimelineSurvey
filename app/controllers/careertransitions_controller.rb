class CareertransitionsController < ApplicationController
 before_filter :current_user , :only => [:new, :create]
 def new
  @user = current_user
  @career = @user.careertransitions.build
 end

 def create

  @user = current_user
  @career = @user.careertransitions.build(career_params)  
  set_career_content
  puts "****************************************************"
  puts @career.content
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
   @career.content = "Private Engr"
  elsif params[:new_career_field] == "Engineering in the public sector"
    @career.content = "Public Engr"
  elsif params[:new_career_field] == "Engineering research lab"
    @career.content = "Engr Research"
  elsif params[:new_career_field] == "Non-engineering"
    @career.content = "Non Engr"
  elsif params[:new_career_field] == "Began my own engineering practice"
    @career.content = "Own Engr Firm"
  elsif params[:new_career_field] == "NGO/non-profit related to engineering"
    @career.content = "Engr NGO"
  elsif params[:new_career_field] == "Military"
    @career.content = "Military"
  elsif params[:new_career_field] == "Academic/education position related to engineering"
    @career.content = "Academic"
  elsif params[:new_career_field] == "Unemployed"
    @career.content = "Unemployed"
  elsif params[:new_career_field] ==  "Working at the same company, but moved from full time to part time/part time to full time"
    @career.content = "Same Co."
  elsif params[:new_career_field] ==  "Environmental"
    @career.content = "Environmental"
  elsif params[:new_career_field] == "Leaving work to take care of family"
    @career.content = "Left: for family"
  elsif params[:new_career_field] == "Leaving work for other reasons"
    @career.content = "Left: for other"
  end
 end
end
