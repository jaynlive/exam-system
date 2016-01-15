class IndexController < ApplicationController
  def index
  	unless session[:user_id].nil?
		  redirect_to panel_index_url
    end
  	@username=""
  	@user = User.new()
  end

  def new
  	userinfo=login_param
  	@username=userinfo[:username]
  	respond_to do |format|
      if user=User.auth(userinfo[:username],userinfo[:password])
      	session[:user_id]=user.id
		    session[:user_username]=user.username
        format.html { redirect_to panel_index_url}
      else
        format.html { redirect_to index_url,:notice => "不正确的用户名/密码" }
      end
    end
  end

  def create
  	@user = User.new(reg_param)
  	respond_to do |format|
      if @user.save
        format.html { redirect_to index_url, notice: "成功创建账户!用户:#{@user.username},姓名:#{@user.name}. "}
      else
        format.html { render :create }
      end
    end
  end
#####修改个人信息
  def show
    # @exams=User.find_by_id(params[:id]).exams
  end
  def edit
  end
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice:"已成功更新用户账户-->用户名：#{@user.username},姓名：#{@user.name}."  }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
  	session[:user_id]=nil
    redirect_to index_url
  end

  private

  def login_param
  	params.permit(:username,:password)
  end
  def reg_param
  	params.permit(:username, :name, :password, :age, :sex, :school, :college, :profession, :work)
  end
end
