class ActivationsController < ApplicationController
  before_filter :require_no_user
  before_filter :find_user

  def create
    if @user.activate!
      flash[:notice] = "Your account has been activated!"
      UserSession.create(@user, false) # Log user in manually
      @user.deliver_welcome!
      redirect_to root_url
    else
      render :action => :new
    end
  end

  def find_user
    @user = User.find_using_perishable_token(params[:activation_code], 1.week)
    redirect_to root_url, :notice => "Sorry, your activation link is incorrect, or has expired. <a href='/users/resend_activation'>Click here to request a new activation link.</a>" unless @user
    redirect_to root_url, :notice => "This account is already activated, please log in to continue." if @user && @user.active?
  end

end
