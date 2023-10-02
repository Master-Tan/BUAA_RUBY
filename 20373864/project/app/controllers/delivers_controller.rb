class DeliversController < ApplicationController
  before_action :set_deliver, only: %i[ show edit update destroy ]

  # GET /delivers or /delivers.json
  def index
    @delivers = Deliver.all
  end

  # GET /delivers/1 or /delivers/1.json
  def show
    @deliver = Deliver.find(params[:id])
  end

  # GET /delivers/new
  def new
    @deliver = Deliver.new
  end

  # GET /delivers/1/edit
  def edit
  end

  # POST /delivers or /delivers.json
  def create
    @deliver = Deliver.new(deliver_params)

    respond_to do |format|
      if @deliver.save
        format.html { redirect_to deliver_url(@deliver), notice: "Deliver was successfully created." }
        format.json { render :show, status: :created, location: @deliver }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @deliver.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /delivers/1 or /delivers/1.json
  def update
    respond_to do |format|
      if @deliver.update(deliver_params)
        format.html { redirect_to deliver_url(@deliver), notice: "Deliver was successfully updated." }
        format.json { render :show, status: :ok, location: @deliver }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @deliver.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /delivers/1 or /delivers/1.json
  def destroy
    @deliver.destroy

    respond_to do |format|
      format.html { redirect_to delivers_url, notice: "Deliver was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def login
    @deliver = Deliver.find_by(username: login_params[:username])
    logger.tagged("DELIVER_LOGIN") { logger.debug "" }
    if @deliver && @deliver.authenticate(login_params[:password])
      @deliver_log = DeliverLog.create(deliver_id: @deliver.id, action: "DELIVER_LOGIN", status: "Success")
      session[:current_deliver_id] = @deliver.id
      # 我们使用 jbuilder
      # render(
      #   json: Api::V1::SessionSerializer.new(user, root: false).to_json,
      #   status: 201
      # )
      #
      logger.tagged("DELIVER_LOGIN") { logger.debug "" }
    else
      api_error(status: 401)
    end
  end

  def logout
    if session.key?(:current_deliver_id)
      @deliver_id = session[:current_deliver_id]
      session.delete(:current_deliver_id)
      @deliver_log = DeliverLog.create(deliver_id: @deliver_id, action: "DELIVER_LOGOUT", status: "Success")
    end
    logger.tagged("DELIVER_LOGOUT") {logger.debug ""}
  end

  def get_current_deliver
    logger.tagged("GET_REGISTER_DELIVER") { logger.debug "" }
    # logger.tagged("CURRENT_USER") {"#{current_user.username}"}
    respond_to do |format|
      if deliver_logged_in?
        format.json { render json: {id: current_deliver.id, username: current_deliver.username}.to_json, status: 200}
      else
        format.json { api_error(status: 401) }
      end
    end
  end

  def register
    logger.tagged("DELIVER_REGISTER") { logger.debug "" }
    if !Deliver.find_by(username: register_params[:username])
      Deliver.create(username: register_params[:username], password: register_params[:password], phone: register_params[:phone])
    else
      logger.tagged("401") { logger.debug "" }
      api_error(status: 401)
    end
  end

  def update_deliver
    logger.tagged("DELIVER_UPDATE") { logger.debug "" }
    @deliver = Deliver.find_by(id: update_params[:id])
    if @deliver
      @deliver.update(update_params)
      api_ok(status: 200)
    else
      logger.tagged("401") { logger.debug "" }
      api_error(status: 401)
    end
  end

  def drop_deliver
    @deliver = Deliver.find_by(id: drop_params[:id])
    if @deliver
      @deliver.destroy
    else
      logger.tagged("401") { logger.debug "" }
      api_error(status: 401)
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_deliver
      @deliver = Deliver.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def deliver_params
      params.require(:deliver).permit(:username, :password, :phone)
    end

    def login_params
      params.require(:deliver).permit(:username, :password)
    end

    def register_params
      params.require(:deliver).permit(:username, :password, :phone)
    end

    def update_params
      params.require(:deliver).permit(:id, :username, :password, :phone)
    end

    def drop_params
      params.require(:deliver).permit(:id)
    end
end
