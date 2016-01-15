class AdministratorsController < BackyardController
  before_action :set_administrator, only: [:show, :edit, :update, :destroy]
  # GET /administrators
  # GET /administrators.json
  def index
    if @logged_administrator.is_admin?
      @administrators = Administrator.all
    else
      redirect_to edit_administrator_url(@logged_administrator)
    end
  end

  # GET /administrators/1
  def show
    if @logged_administrator.is_admin?
      redirect_to administrators_url
    else
      redirect_to edit_administrator_path(@logged_administrator)
    end
  end

  # GET /administrators/new
  def new
    if @logged_administrator.is_admin?
      @administrator = Administrator.new
    else
      redirect_to edit_administrator_path(@logged_administrator),notice: "抱歉，您没有新建管理员账户的权限"
    end
  end

  # GET /administrators/1/edit
  def edit
    unless @logged_administrator.id==params[:id].to_i
      unless @logged_administrator.is_admin?
        redirect_to edit_administrator_path(@logged_administrator),notice:"您只能编辑你自己的信息"
      end
    end
  end

  # POST /administrators
  # POST /administrators.json
  def create
    unless @logged_administrator.is_admin?
      redirect_to edit_administrator_path(@logged_administrator),notice:"抱歉，您没有新建管理员账户的权限"
    else
      @administrator = Administrator.new(administrator_params)

      respond_to do |format|
        if @administrator.save
          format.html { redirect_to administrators_url, notice: "已成功创建管理员账户：#{@administrator.username}." }
        else
          format.html { render :new }
        end
      end
    end
  end

  # PATCH/PUT /administrators/1
  # PATCH/PUT /administrators/1.json
  def update
    unless @logged_administrator.id==params[:id].to_i
      unless @logged_administrator.is_admin?
        redirect_to edit_administrator_path(@logged_administrator),notice:"您只能编辑你自己的信息"
        return
      end
    end
    respond_to do |format|
      if @administrator.update(administrator_params)
        format.html { redirect_to administrators_url, notice: '成功修改管理员账户信息.' }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /administrators/1
  # DELETE /administrators/1.json
  def destroy
    unless @logged_administrator.is_admin?
      redirect_to edit_administrator_path(@logged_administrator),notice:"抱歉，您没有删除管理员账户的权限"
      return
    end

    @administrator.destroy
    respond_to do |format|
      format.html { redirect_to administrators_url, notice: '已删除管理员账户' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_administrator
      @administrator = Administrator.find(params[:id])
    end
    # Never trust parameters from the scary internet, only allow the white list through.
    def administrator_params
      if @logged_administrator.is_admin?
        params.require(:administrator).permit(:username, :password,:password_confirmation, :is_admin)
      else
        params.require(:administrator).permit(:username, :password,:password_confirmation)
      end
    end
end
