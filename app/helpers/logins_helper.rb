module LoginsHelper

	def sign_in(user) # 把用戶登入
		session[:login_token] = user.login_token
	end

	def signed_in?
		!current_user.nil?
	end

	def current_user
		@current_user ||= User.find_by_login_token(session[:login_token])
	end

	def current_user?(user)
		current_user == user
	end

	def sign_out
		@current_user = nil
		session.delete(:login_token)
	end
end
