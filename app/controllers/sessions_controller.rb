class SessionsController < ApplicationController
  
  def create
    user = User.authenticate(params[:session][:email], params[:session][:password])
    if user.nil?
      flash.now[:error] = t(:"flash.sign_in_error")
      render "new"
    else
      sign_in user
      flash[:success] = t(:"flash.sign_in")
      redirect_to user_path(user.username)
    end        
  end
  
  def destroy
    sign_out
    flash[:success] = t(:"flash.sign_out")
    redirect_to root_path
  end

end