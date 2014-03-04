class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  include SessionsHelper

  before_action :first_user, :login?

  private
  	def first_user
	  	User.create(username: "admin", email: "admin@admin.com", admin: true, password: "999999") if User.count.zero?
	  end
  	def login?
  		redirect_to login_path, alert: "You must login first!" unless session[:user_id]
  	end
	  def admin?
	  	redirect_to root_path, alert: "You are not admin!" unless current_user.admin
	  end
	  
end
