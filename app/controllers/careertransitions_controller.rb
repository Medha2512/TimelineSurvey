class CareertransitionsController < ApplicationController
  before_filter :current_user , :only => [:new, :create]
  def new
    @user = current_user
    @career = @user.careertransitions.build
  end

  def create

    @user = current_user
    @career = @user.careertransitions.build(career_params)
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
