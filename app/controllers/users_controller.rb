class UsersController < ApplicationController
	def new
		@user = User.new
	end

	def show
		
	end

	def create
		@user = User.new(user_params)

		if @user.save
			# sign_in(@user)
			flash[:success] = "Welcome, #{@user.name}!"
			redirect_to :back
		else	
			flash[:error] = "There are #{@user.errors.count} errors, #{@user.errors.full_messages}" 
			render action: 'new'
		end
	end

protected
	def user_params
		params.require(:user).permit(:account, :name, :password, :password_confirmation)
	end
end
