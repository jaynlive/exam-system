class SessionsController < ApplicationController
	layout nothing: true
	## get /login
	def new
		if session[:administrator_id]
			redirect_to admin_url
		end
	end

	## post /login
	def create
		if administrator = Administrator.auth(params[:username],params[:password])
			session[:administrator_id]=administrator.id
			session[:administrator_username]=administrator.username
			redirect_to admin_url
		else
			redirect_to login_url,:alert => "不正确的用户名/密码"
		end
	end

	## delete /logout
	def destroy
		session[:administrator_id]=nil
		redirect_to login_url,notice: "已退出登录"
	end
end
