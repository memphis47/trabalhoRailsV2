class SessionsController < ApplicationController
  before_filter :authenticate_user, :only => [:orchestras, :conductors, :instruments, :integrants, :users]
  before_filter :save_login_state, :only => [:new]
  before_filter :verifyUser, :only => [:orchestras, :conductors, :instruments, :integrants, :users]
  def new  
  end  
    
  def create  
    user = User.authenticate(params[:email], params[:password])  
    if user  
      session[:user_id] = user.id  
      redirect_to :orchestras, :notice => "Logged in!"  
    else  
      flash.now.alert = "Invalid email or password"  
      render "new"  
    end  
  end
  def destroy  
	  session[:user_id] = nil  
	  redirect_to root_url, :notice => "Logged out!"  
  end 
end
