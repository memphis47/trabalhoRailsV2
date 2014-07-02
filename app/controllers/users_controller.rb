class UsersController < ApplicationController  
  skip_before_action :authenticate_user, only: [:new, :create, :index]

  def new  
    @user = User.new  
  end  

  def index
    @users = User.all
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