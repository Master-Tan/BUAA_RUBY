class AdministratorsController < ApplicationController
  before_action :set_administrator, only: %i[ show edit update destroy ]

  # GET /administrators or /administrators.json
  def index
    @administrators = Administrator.all
  end

  # GET /administrators/1 or /administrators/1.json
  def show
    @administrators = Administrator.find(params[:id])
  end

  # GET /administrators/new
  def new
    @administrator = Administrator.new
  end

  # GET /administrators/1/edit
  def edit
  end

  # POST /administrators or /administrators.json
  def create
    @administrator = Administrator.new(administrator_params)

    respond_to do |format|
      if @administrator.save
        format.html { redirect_to administrator_url(@administrator), notice: "Administrator was successfully created." }
        format.json { render :show, status: :created, location: @administrator }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @administrator.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /administrators/1 or /administrators/1.json
  def update
    respond_to do |format|
      if @administrator.update(administrator_params)
        format.html { redirect_to administrator_url(@administrator), notice: "Administrator was successfully updated." }
        format.json { render :show, status: :ok, location: @administrator }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @administrator.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /administrators/1 or /administrators/1.json
  def destroy
    @administrator.destroy

    respond_to do |format|
      format.html { redirect_to administrators_url, notice: "Administrator was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def login
    @administrator = Administrator.find_by(username: login_params[:username])
    logger.tagged("ADMIN_LOGIN") { logger.debug "" }
    if @administrator && @administrator.authenticate(login_params[:password])
      @administrator_log = AdministratorLog.create(administrator_id: @administrator.id, action: "ADMIN_LOGIN", status: "Success")
      session[:current_administrator_id] = @administrator.id
      # 我们使用 jbuilder
      # render(
      #   json: Api::V1::SessionSerializer.new(user, root: false).to_json,
      #   status: 201
      # )
      #
      logger.tagged("ADMIN_LOGIN") { logger.debug "" }
    else
      api_error(status: 401)
    end
  end

  def logout
    if session.key?(:current_administrator_id)
      @admin_id = session[:current_administrator_id]
      session.delete(:current_administrator_id)
      @administrator_log = AdministratorLog.create(administrator_id: @admin_id, action: "ADMIN_LOGOUT", status: "Success")
    end
    logger.tagged("ADMIN_LOGOUT") {logger.debug ""}
  end

  def get_current_administrator
    logger.tagged("GET_REGISTER_ADMIN") { logger.debug "" }
    # logger.tagged("CURRENT_USER") {"#{current_user.username}"}
    respond_to do |format|
      if administrator_logged_in?
        format.json { render json: {id: current_administrator.id, username: current_administrator.username}.to_json, status: 200}
      else
        format.json { api_error(status: 401) }
      end
    end
  end

  def register
    logger.tagged("ADMIN_REGISTER") { logger.debug "" }
    if !Administrator.find_by(username: register_params[:username])
      Administrator.create(register_params)
      # @administrator_log[:status] = "Success!"
    else
      logger.tagged("401") { logger.debug "" }
      api_error(status: 401)
      # @administrator_log[:status] = "Fail!"
    end
  end

  def update_administrator
    logger.tagged("ADMIN_UPDATE") { logger.debug "" }
    @administrator = Administrator.find_by(id: update_params[:id])
    if @administrator
      @administrator.update(update_params)
      api_ok(status: 200)
    else
      logger.tagged("401") { logger.debug "" }
      api_error(status: 401)
    end
  end

  def drop_administrator
    @administrator = Administrator.find_by(id: drop_params[:id])
    if @administrator
      @administrator.destroy
    else
      logger.tagged("401") { logger.debug "" }
      api_error(status: 401)
    end
  end



  private
    # Use callbacks to share common setup or constraints between actions.
    def set_administrator
      @administrator = Administrator.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def administrator_params
      params.require(:administrator).permit(:username, :password, :level)
    end

    def login_params
      params.require(:administrator).permit(:username, :password)
    end

    def register_params
      params.require(:administrator).permit(:username, :password, :level)
    end

    def update_params
      params.require(:administrator).permit(:id, :username, :password, :level)
    end

    def drop_params
      params.require(:administrator).permit(:id)
    end
end
