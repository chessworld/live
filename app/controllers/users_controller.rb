class UsersController < ApplicationController
  before_filter :require_no_user, :only => [:new, :create, :request_password_reset, :reset_password]
  before_filter :require_user, :only => [:show, :edit, :update]
  before_filter :require_admin, :only => [:index]
  
  def index
    @users = User.all
  end
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(params[:user])

    # Saving without session maintenance to skip
    # auto-login which can't happen here because
    # the User has not yet been activated
    if @user.save_without_session_maintenance
      @user.deliver_activation_instructions!
      flash[:notice] = "Your account has been created. Please check your e-mail for your account activation instructions!"
      redirect_to root_url
    else
      render :action => :new
    end
  end
  
  def show
    @user = User.find_by_id(params[:id])
    raise "Access Denied" unless current_user.admin? || current_user == @user
  end

  def edit
    @user = User.find_by_id(params[:id])
    raise "Access Denied" unless current_user.admin? || current_user == @user
  end
  
  def update
    @user = User.find_by_id(params[:id])
    raise "Access Denied" unless current_user.admin? || current_user == @user
    params[:user].remove :suspend_until if params[:user] && !current_user.admin?
    if @user.update_attributes(params[:user])
      flash[:notice] = "Account updated!"
      redirect_to user_url(@user)
    else
      render :action => :edit
    end
  end

  def resend_activation
    if params[:login]
      @user = User.find_by_login params[:login]
      if @user && !@user.active?
        @user.deliver_activation_instructions!
        flash[:notice] = "Please check your e-mail for your account activation instructions!"
        redirect_to root_path
      else
        flash[:notice] = "Sorry, this login is not registered."
      end
    end
  end
  
  def request_password_reset
    if params[:login]
      @user = User.find_by_login params[:login]
      if @user
        @user.deliver_password_reset_instructions!
        flash[:notice] = "Instructions to reset your password have been emailed to you. " +  
        "Please check your email."  
        redirect_to root_path
      end
    end
  end
  
  def reset_password
    @user = User.find params[:id]
    unless @user.perishable_token == params[:token]
      flash[:notice] = "We're sorry, but we could not locate your account. " +  
        "If you are having issues try copying and pasting the URL " +  
        "from your email into your browser or restarting the " +  
        "reset password process."
      redirect_to root_path
    end
    if params[:user] && params[:user][:password]
      if @user.update_attributes params[:user]
        flash[:notice] = "Password updated!"
        redirect_to root_path
      end
    end
  end
  
  private
    def require_admin
      head 403 unless current_user && current_user.admin?
    end
end
