class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  #protect_from_forgery
  
  before_action :authenticate_user
  helper_method :current_user  
    
  private  
  def current_user  
    @current_user ||= User.find(session[:user_id]) if session[:user_id]  
  end

  protected
	def authenticate_user
		if session[:user_id]
			# set current user object to @current_user object variable
			@current_user = User.find session[:user_id]
			if(@current_user.auth=="admin")
				return true
			else
				redirect_to :action =>'index'
			end	
		else
			redirect_to :controller => 'sessions', :action => 'new'
			return false
		end
	end
	def save_login_state
		if session[:user_id]
			redirect_to(:controller => 'sessions', :action => :orchestra)
			return false
		else
			return true
		end
	end
end
