class CareertransitionsController < ApplicationController

  def new
    @user = User.find session[:user_id] 
    @career = @user.careertransitions.build
  end

  def create
    
    @user = User.find session[:user_id] 
    @career = @user.careertransitions.build(career_params)
   
    @count = @user.event_count + 1
    @user.update_attributes(:event_count => @count)
    if @career.save
      flash[:notice] = "Career event logged"
      flash[:color]= "valid"
    else
      flash[:notice] = "Career event incorrect"
      flash[:color]= "invalid"
    end
    redirect_to(:controller => 'sessions', :action => 'setting')
  end

  private

  def career_params
    params.require(:careertransition).permit(:new_career_field, :event_time)
  end
end
