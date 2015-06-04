class UsersController < ApplicationController
	def new
		@user = User.new
	end

	def show
	end

	def create
		@user = User.new(user_params)

		if @user.save
			flash[:success] = "Welcome, #{@user.name}!"
			redirect_to admin_categories_path
		else	
			flash[:error] = "There are #{@user.errors.count} errors, #{@user.errors.full_messages}" 
			render action: 'new'
		end
	end

	def edit
		
	end

	def update
		if params[:user][:new_password] == params[:user][:password_confirmation]
			if current_user.authenticate(params[:user][:password])
				current_user.password = params[:user][:new_password]
				if current_user.save
					flash[:success]	= "您已成功修改密碼"
					redirect_to admin_categories_path
				end
			else		
				flash[:error] = "您輸入的密碼不正確"
				render action: 'edit'
			end
		else
			flash[:error] = "您輸入的新密碼不一致"
			render action: 'edit'
		end
	end

protected
	def user_params
		params.require(:user).permit(:account, :name, :password, :password_confirmation)
	end
end
