module Admin::LoginsHelper

	def sign_in(user) # 把用戶登入
		session[:login_token] = user.login_token
	end

	def signed_in? # 用戶登入了嗎
		!current_user.nil?
	end

	def current_user # 現在登入的用戶
		@current_user ||= User.find_by_login_token(session[:login_token])
	end

	def current_user?(user) # user是現在登入的用戶嗎
		current_user == user
	end

	def sign_out # 登出
		@current_user = nil
		session.delete(:login_token)
	end

	def authenticate_user
		unless signed_in?
			flash[:warning] = "請先登入"
			redirect_to new_admin_login_path
		end
	end
end
