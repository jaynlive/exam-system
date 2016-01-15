class BackyardController < ApplicationController
	before_filter :authorize
	before_action :set_logged_administrator
	def logged_administrator
		Administrator.find_by_id(session[:administrator_id])
	end
	protected
	def authorize
		if !(session[:administrator_id].nil?) && Administrator.find_by_id(session[:administrator_id])
		else
			session[:administrator_id] = nil
			respond_to do |format|
				format.html {redirect_to login_url,alert:"请登录后再使用后台系统"}
				format.json {render json: {code: 403,message:"请登录后再使用后台系统",message_en:"You Are Not authorized to access these data,please log in first"}, status: :forbidden}
			end
			return 
		end
	end
	def set_logged_administrator
      @logged_administrator=logged_administrator
    end
end