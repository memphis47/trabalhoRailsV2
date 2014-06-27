class SessionsController < ApplicationController
  before_filter :authenticate_user, :only => [:home, :profile, :setting]
  before_filter :save_login_state, :only => [:login, :login_attempt]
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
