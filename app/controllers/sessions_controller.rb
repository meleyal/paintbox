class SessionsController < ApplicationController
  
  def create
    user = User.authenticate( params[:session][:email],
                              params[:session][:password] )
        
    if user.nil?
      # create an error and re-render the signin form
      flash.now[:error] = "Invalid email/password combination"
      @title = "Sign in"
      render "new"
    else
      # signin the user and redirect to the users show page
      sign_in user
      redirect_to user
    end        
  end
  
  def destroy
    sign_out
    redirect_to root_path
  end

end
