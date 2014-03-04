class SessionsController < ApplicationController
  skip_before_action :login?, only: [:new, :create]

  def new
    redirect_to root_path, alert: "You have login." if current_user
  end

  def create
    user = User.find_by_username(params[:session][:username].downcase)
    if user && user == User.authenticate(user.username, params[:session][:password])
      session[:user_id] = user.id
      redirect_to root_path, notice: "Welcome! Time now is: #{Time.new.strftime('%Y-%m-%d %H:%M:%S').to_s}"
    else
      flash.now[:alert] = "Invalid Login information"
      render :new
    end
  end

  def destroy
  	session[:user_id] = nil
  	redirect_to login_path, notice: "If you want to login again, please input your login information"
  end

end
