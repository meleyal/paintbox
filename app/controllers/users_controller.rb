class UsersController < ApplicationController
  
  before_filter :authenticate,  :only => [:edit, :update]
  before_filter :correct_user,  :only => [:edit, :update]
  before_filter :admin_user,    :only => [:destroy]  
  
  def index
    @users = User.all
  end
  
  def show
    @user = User.find_by_username(params[:id])
    @swatch = Swatch.new if signed_in?
    @title = @user.username
    @page_id = "profile"
  end
  
  def new
    @title = "sign up"
    @user = User.new
  end
  
  def edit
    @title = "settings"
  end
  
  def create
    @user = User.new(params[:user])
    if @user.save
      sign_in @user
      flash[:success] = t(:"flash.welcome")
      redirect_to user_path(@user.username)
    else
      flash[:error] = t(:"flash.error")
      render "new"
    end
  end
  
  def update
    if @user.update_attributes(params[:user])
      flash[:success] = t(:"flash.profile_updated")
      redirect_to user_path(@user.username)
    else
      flash[:error] = t(:"flash.error")
      render "edit"
    end
  end
  
  def destroy    
    User.find_by_username(params[:id]).destroy        
    flash[:success] = t(:"flash.user_deleted")
    redirect_to users_path
  end
  
  private
        
    def correct_user
      @user = current_user || User.find_by_username(params[:id])    
      redirect_to(root_path) unless current_user?(@user)
    end

    def admin_user
      redirect_to(root_path) unless current_user.admin?
    end

end