class Admin::LoginsController < ApplicationController
  def new

  end

  def create
  	@user = User.find_by_account(params[:login][:account])
  	# 用login這個form的email資料

  	if @user && @user.authenticate(params[:login][:password])
  	# 如果有找到這個user且password驗證成功就登入 
	    sign_in(@user)
      flash[:success] = "歡迎回來, #{@user.name}!"
      redirect_to admin_categories_path
  	else
		  flash[:error] = "您輸入的帳號/密碼有誤"
      render action: 'new'
  	end
  end

  def destroy
    sign_out
    flash[:success] = "您已成功登出"
    redirect_to welcome_index_path
  end
end
