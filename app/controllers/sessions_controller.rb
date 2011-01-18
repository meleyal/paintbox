class SessionsController < ApplicationController

  def new
    @title = "login"
  end
  
  def create
    user = User.authenticate(params[:session][:email],
                             params[:session][:password])
        
    if user.nil?
      flash.now[:error] = "Invalid email / password"
      @title = "sign in"
      render "new"
    else
      sign_in user
      flash[:success] = "Hello!"      
      redirect_back_or user
    end        
  end
  
  def destroy
    sign_out
    flash[:success] = "Bye!"
    redirect_to root_path
  end

end
