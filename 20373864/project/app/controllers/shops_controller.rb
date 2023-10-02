class ShopsController < ApplicationController
  before_action :set_shop, only: %i[ show edit update destroy ]

  # GET /shops or /shops.json
  def index
    @shops = Shop.all
  end

  # GET /shops/1 or /shops/1.json
  def show
    @shop = Shop.find(params[:id])
  end

  # GET /shops/new
  def new
    @shop = Shop.new
  end

  # GET /shops/1/edit
  def edit
  end

  # POST /shops or /shops.json
  def create
    @shop = Shop.new(shop_params)

    respond_to do |format|
      if @shop.save
        format.html { redirect_to shop_url(@shop), notice: "Shop was successfully created." }
        format.json { render :show, status: :created, location: @shop }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @shop.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /shops/1 or /shops/1.json
  def update
    respond_to do |format|
      if @shop.update(shop_params)
        format.html { redirect_to shop_url(@shop), notice: "Shop was successfully updated." }
        format.json { render :show, status: :ok, location: @shop }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @shop.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /shops/1 or /shops/1.json
  def destroy
    @shop.destroy

    respond_to do |format|
      format.html { redirect_to shops_url, notice: "Shop was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def login
    @shop = Shop.find_by(username: login_params[:username])
    logger.tagged("SHOP_LOGIN") { logger.debug "#{params}" }
    if @shop && @shop.authenticate(login_params[:password])
      @shop_log = ShopLog.create(shop_id: @shop.id, action: "SHOP_LOGIN", status: "Success")
      session[:current_shop_id] = @shop.id
      # 我们使用 jbuilder
      # render(
      #   json: Api::V1::SessionSerializer.new(user, root: false).to_json,
      #   status: 201
      # )
      #
      logger.tagged("SHOP_LOGIN") { logger.debug "#{session.keys}" }
    else
      api_error(status: 401)
    end
  end

  def logout
    if session.key?(:current_shop_id)
      @shop_id = session[:current_shop_id]
      session.delete(:current_shop_id)
      @shop_log = ShopLog.create(shop_id: @shop_id, action: "SHOP_LOGOUT", status: "Success")
    end
    logger.tagged("SHOP_LOGOUT") {logger.debug ""}
  end

  def get_current_shop
    logger.tagged("GET_REGISTER_SHOP") { logger.debug "" }
    # logger.tagged("CURRENT_USER") {"#{current_user.username}"}
    respond_to do |format|
      if shop_logged_in?
        format.json { render json: {id: current_shop.id, username: current_shop.username}.to_json, status: 200}
      else
        format.json { api_error(status: 401) }
      end
    end
  end

  def register
    logger.tagged("DELIVER_SHOP") { logger.debug "" }
    if !Shop.find_by(username: register_params[:username]) and Canteen.find_by(id: register_params[:canteen_id])
      register_params_copy = register_params.dup
      register_params_copy.delete(:image_directory)
      logger.tagged("PARAMS") { logger.debug "#{register_params_copy}" }
      @shop = Shop.create(register_params_copy)
      if register_params[:image_directory]
        logger.tagged("IMAGE_DIRECTORY") { logger.debug "#{register_params[:image_directory]}" }
        # @image_io = File.open(product_params[:image_directory])
        # @image_base64 = Base64.encode64(@image_io.read)
        # logger.tagged("BASE64") { logger.debug "#{@image_base64}" }
        # logger.tagged("BASE64_END") { logger.debug "" }
        @image_base64 = register_params[:image_directory]
        @image_base64.sub!(/\Adata:image\/(png|jpg|jpeg);base64,/, "")
        logger.tagged("IMAGE_DIRECTORY2") { logger.debug "#{@image_base64}" }
        @image_data = Base64.decode64(@image_base64)
        @image_io = StringIO.new(@image_data)
        blob = ActiveStorage::Blob.create_and_upload!(io: @image_io, filename: "image.png")
        @shop.image.attach(blob)
        ActiveStorage::Current.url_options = { host: "127.0.0.1:3000", protocol: "http" }
        logger.tagged("IMAGE") { logger.debug "#{@shop.image.url(expires_in: 10.years)}" }
        @shop[:image_directory] = "#{@shop.image.url(expires_in: 10.years)}"
        @shop.save
      end
      api_ok(status: 200)
    else
      logger.tagged("401") { logger.debug "" }
      api_error(status: 401)
    end
  end

  def update_shop
    logger.tagged("SHOP_UPDATE") { logger.debug "" }
    @shop = Shop.find_by(id: update_params[:id])
    if @shop
      @shop.update(update_params)
      api_ok(status: 200)
    else
      logger.tagged("401") { logger.debug "" }
      api_error(status: 401)
    end
  end

  def drop_shop
    @shop = Shop.find_by(id: drop_params[:id])
    if @shop
      @shop.destroy
    else
      logger.tagged("401") { logger.debug "" }
      api_error(status: 401)
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_shop
      @shop = Shop.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def shop_params
      params.require(:shop).permit(:username, :password, :phone, :open_time, :close_time, :address, :canteen_id, :image_directory)
    end

    def login_params
      params.require(:shop).permit(:username, :password)
    end

    def register_params
      shop_params
    end

    def update_params
      params.require(:shop).permit(:id, :username, :password, :phone, :open_time, :close_time, :address, :canteen_id, :image_directory)
    end

    def drop_params
      params.require(:shop).permit(:id)
    end
end
