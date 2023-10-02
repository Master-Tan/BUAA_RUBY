class CanteensController < ApplicationController
  before_action :set_canteen, only: %i[ show edit update destroy ]

  # GET /canteens or /canteens.json
  def index
    @canteens = Canteen.all
  end

  # GET /canteens/1 or /canteens/1.json
  def show
  end

  # GET /canteens/new
  def new
    @canteen = Canteen.new
  end

  # GET /canteens/1/edit
  def edit
  end

  # POST /canteens or /canteens.json
  def create
    if !Canteen.find_by(canteen_name: canteen_params[:canteen_name])
      @canteen = Canteen.new(canteen_params)
      @canteen.save
      respond_to do |format|
        format.json { render :show, status: :created, location: @canteen }
      end
    else
      respond_to do |format|
        format.json { render json: nil, status: 401 }
      end
    end
  end

  # PATCH/PUT /canteens/1 or /canteens/1.json
  def update
    respond_to do |format|
      if @canteen.update(canteen_params)
        format.html { redirect_to canteen_url(@canteen), notice: "Canteen was successfully updated." }
        format.json { render :show, status: :ok, location: @canteen }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @canteen.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /canteens/1 or /canteens/1.json
  def destroy
    @canteen.destroy

    respond_to do |format|
      format.html { redirect_to canteens_url, notice: "Canteen was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def login
    @canteen = Canteen.find_by(canteen_name: login_params[:canteen_name])
    logger.tagged("CANTEEN_LOGIN") { logger.debug "" }
    if @canteen && @canteen.authenticate(login_params[:password])
      session[:current_canteen_id] = @canteen.id
      # 我们使用 jbuilder
      # render(
      #   json: Api::V1::SessionSerializer.new(user, root: false).to_json,
      #   status: 201
      # )
      #
      logger.tagged("CANTEEN_LOGIN") { logger.debug "" }
    else
      api_error(status: 401)
    end
  end

  def logout
    if session.key?(:current_canteen_id)
      @canteen_id = session[:current_canteen_id]
      session.delete(:current_canteen_id)
      api_ok(status: 200)
    end
    logger.tagged("CANTEEN_LOGOUT") {logger.debug ""}
  end

  def get_current_canteen
    logger.tagged("GET_REGISTER_CANTEEN") { logger.debug "" }
    # logger.tagged("CURRENT_USER") {"#{current_user.canteen_name}"}
    respond_to do |format|
      if canteen_logged_in?
        format.json { render json: {id: current_canteen.id, canteen_name: current_canteen.canteen_name}.to_json, status: 200}
      else
        format.json { api_error(status: 401) }
      end
    end
  end
  
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_canteen
      @canteen = Canteen.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def canteen_params
      params.require(:canteen).permit(:canteen_name, :password)
    end

    def login_params
      params.require(:canteen).permit(:canteen_name, :password)
    end
end
