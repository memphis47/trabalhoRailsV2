class UsersController < ApplicationController  
   skip_before_action :authenticate_user, only: [:index]
  def new  
    @user = User.new  
  end  

  def index
    @users = User.all
    if session[:user_id]
      @current_user = User.find session[:user_id]
    end
    if(@current_user!=nil && @current_user.auth!="admin")
      redirect_to :controller => 'sessions', :action => 'new'
    end
  end
    
  def create  
    @user = User.new(params[:user])
    @user.auth="user"
    if @user.save  
      redirect_to root_url, :notice => "Signed up!"  
    else  
      render "new"  
    end  
  end  
end  