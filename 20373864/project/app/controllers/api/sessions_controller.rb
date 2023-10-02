class Api::SessionsController < ApplicationController
  before_action :set_api_session, only: %i[ show edit update destroy ]

  # GET /api/sessions or /api/sessions.json
  def index
    @api_sessions = Api::Session.all
  end

  # GET /api/sessions/1 or /api/sessions/1.json
  def show
  end

  # GET /api/sessions/new
  def new
    @api_session = Api::Session.new
  end

  # GET /api/sessions/1/edit
  def edit
  end

  # POST /api/sessions or /api/sessions.json
  def create
    @api_session = Api::Session.new(api_session_params)

    respond_to do |format|
      if @api_session.save
        format.html { redirect_to api_session_url(@api_session), notice: "Session was successfully created." }
        format.json { render :show, status: :created, location: @api_session }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @api_session.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /api/sessions/1 or /api/sessions/1.json
  def update
    respond_to do |format|
      if @api_session.update(api_session_params)
        format.html { redirect_to api_session_url(@api_session), notice: "Session was successfully updated." }
        format.json { render :show, status: :ok, location: @api_session }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @api_session.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /api/sessions/1 or /api/sessions/1.json
  def destroy
    @api_session.destroy

    respond_to do |format|
      format.html { redirect_to api_sessions_url, notice: "Session was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def login
    @user = User.find_by(username: login_params[:username])
    logger.tagged("USER_LOGIN") { logger.debug "" }
    if @user && @user.authenticate(login_params[:password])
      @user_log = UserLog.create(user_id: @user.id, action: "USER_LOGIN", status: "Success")
      session[:current_user_id] = @user.id
    else
      api_error(status: 401)
    end
  end

  def logout
    if session.key?(:current_user_id)
      @user_id = session[:current_user_id]
      session.delete(:current_user_id)
      @user_log = UserLog.create(user_id: @user_id, action: "USER_LOGOUT", status: "Success")
    end
    logger.tagged("USER_LOGOUT") {logger.debug ""}
  end

  def get_current_user
    logger.tagged("GET_REGISTER_USER") { logger.debug "" }
    # logger.tagged("CURRENT_USER") {"#{current_user.username}"}
    respond_to do |format|
      if user_logged_in?
        format.json { render json: {id: current_user.id, username: current_user.username}.to_json, status: 200}
      else
        format.json { api_error(status: 401) }
      end
    end
  end

  def register
    logger.tagged("USER_REGISTER") { logger.debug "" }
    if !User.find_by(username: register_params[:username])
      User.create(register_params)
      @admin_id = session[:current_administrator_id]
      @administrator_log = AdministratorLog.create(administrator_id: @admin_id, action: "CREATE_USER", status: "Success")
    else
      logger.tagged("401") { logger.debug "" }
      api_error(status: 401)
    end
  end

  def update_user
    logger.tagged("USER_UPDATE") { logger.debug "" }
    @user = User.find_by(id: update_params[:id])
    if @user
      @user.update(update_params)
      api_ok(status: 200)
    else
      logger.tagged("401") { logger.debug "" }
      api_error(status: 401)
    end
  end

  def drop_user
    @user = User.find_by(id: drop_params[:id])
    if @user
      @user.destroy
      @admin_id = session[:current_administrator_id]
      @administrator_log = AdministratorLog.create(administrator_id: @admin_id, action: "DROP_USER", status: "Success")
    else
      logger.tagged("401") { logger.debug "" }
      api_error(status: 401)
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_api_session
      @api_session = Api::Session.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def api_session_params
      params.fetch(:api_session, {})
    end

    def login_params
      params.require(:user).permit(:username, :password)
    end

    def register_params
      params.require(:user).permit(:username, :password, :phone, :email, :address)
    end

    def update_params
      params.require(:user).permit(:id, :username, :password, :phone, :email, :address)
    end

    def drop_params
      params.require(:user).permit(:id)
    end
end
