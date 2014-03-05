class UsersController < ApplicationController

	before_action :admin?, only: [:new, :create, :index, :destroy]

  def index
  	@users = User.all.order(:username)
  end

  def new
  	@user = User.new
  end

  def create
  	@user = User.new(params.require(:user).permit(:email, :username, :admin, :password, :passowrd_confirmation))
  	respond_to do |format|
  		if @user.save
	  		format.html { redirect_to users_path, notice: "User #{@user.username} create successfully!" }
	  	else
        flash.now[:alert] = "User create fail"
	  		format.html { render :new }
	  	end
  	end
  end

  def show
  	
  end

  def edit
  	@user = current_user.admin? ? User.find(params[:id]) : current_user
  end

  def update
  	@user = current_user.admin? ? User.find(params[:id]) : current_user
		if user = User.authenticate(@user.username, params[:user][:password])
			if params[:user][:password_new].present?
        if params[:user][:password_new] == params[:user][:password_new_confirmation]
  				if @user.update( email: params[:user][:email], admin: params[:user][:admin], password: params[:user][:password_new] )
  	  			User.write_json
            if current_user.admin
  	  				redirect_to users_path, notice: "User #{@user.username} update successfully!"
  	  			else
  	  				redirect_to root_path, notice: "User #{@user.username} update successfully!"
  	  			end
  	  		else
  	  			flash.now[:alert] = "User update fail"
  					render :edit
  	  		end
        else
          flash.now[:alert] = "Two new password is not the same."
          render :edit
        end
	  	else
	  		@user.update(email: params[:user][:email], admin: params[:user][:admin])
        if current_user.admin
          redirect_to users_path, notice: "User #{@user.username} update successfully!"
        else
          redirect_to root_path, notice: "User #{@user.username} update successfully!"
        end
			end
  	else
      flash.now[:alert] = "User update fail"
			render :edit
  	end
  end

  def destroy
  	@user = User.find(params[:id])
  	respond_to do |format|
  		@user.destroy
      User.write_json
  		format.html { redirect_to users_path, notice: "User #{@user.username} delete successfully!" }
  	end
  end

end
