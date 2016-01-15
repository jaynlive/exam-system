class FrontController < ApplicationController
	before_filter :authorize
	before_action :set_logged_user
	layout "panel"
	def logged_user
		User.find_by_id(session[:user_id])
	end
	protected
	def authorize
		unless !(session[:user_id].nil?) && User.find_by_id(session[:user_id])
			respond_to do |format|
				format.html {redirect_to index_url,alert:"请登录后再使用本系统"}
				format.json {render json: {code: 403,message:"请登录后再使用本系统",message_en:"You Are Not authorized to access before log in"}, status: :forbidden}
			end
			return 
		end
	end
	def set_logged_user
      @logged_user=logged_user
    end
end