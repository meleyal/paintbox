class UsersController < ApplicationController
  
  before_filter :authenticate,  :only => [:edit, :update]
  before_filter :correct_user,  :only => [:edit, :update]
  before_filter :admin_user,    :only => [:destroy]  
  
  def index
    @users = User.all
  end
  
  def show
    # @user = User.find(params[:id])
    # @user = User.find_by_username(params[:id])
    @user = User.find_by_identifier(params[:id])
    @swatches = @user.swatches.all(:order => 'created_at DESC', :include => :color)
    @swatch = Swatch.new if signed_in?    
    @title = @user.username
  end
  
  def new
    @title = "sign up"
    @user = User.new
  end
  
  def edit
    @title = "settings"
    # @user = User.find_by_identifier(params[:id]) # provided by before_filter :correct_user
  end
  
  def create
    @user = User.new(params[:user])
    if @user.save
      sign_in @user
      flash[:success] = "welcome to paintbox.es"
      redirect_to @user
    else
      flash[:error] = "error"
      render "new"
    end
  end
  
  def update
    # @user = User.find(params[:id]) # provided by before_filter :correct_user
    if @user.update_attributes(params[:user])
      flash[:success] = "profile udpated"
      redirect_to @user
    else
      # flash[:error] = "error (#{@user.errors.count})"
      flash[:error] = "error"      
      render "edit"
      # redirect_to settings_path
    end
  end
  
  def destroy    
    User.find_by_identifier(params[:id]).destroy        
    flash[:success] = "user deleted"
    redirect_to users_path
  end
  
  private
        
    def correct_user
      @user = current_user || User.find_by_identifier(params[:id])    
      redirect_to(root_path) unless current_user?(@user)
    end

    def admin_user
      redirect_to(root_path) unless current_user.admin?
    end

end