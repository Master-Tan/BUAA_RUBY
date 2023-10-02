class ShopLogsController < ApplicationController
  before_action :set_shop_log, only: %i[ show edit update destroy ]

  # GET /shop_logs or /shop_logs.json
  def index
    @shop_logs = ShopLog.all
  end

  # GET /shop_logs/1 or /shop_logs/1.json
  def show
  end

  # GET /shop_logs/new
  def new
    @shop_log = ShopLog.new
  end

  # GET /shop_logs/1/edit
  def edit
  end

  # POST /shop_logs or /shop_logs.json
  def create
    @shop_log = ShopLog.new(shop_log_params)

    respond_to do |format|
      if @shop_log.save
        format.html { redirect_to shop_log_url(@shop_log), notice: "Shop log was successfully created." }
        format.json { render :show, status: :created, location: @shop_log }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @shop_log.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /shop_logs/1 or /shop_logs/1.json
  def update
    respond_to do |format|
      if @shop_log.update(shop_log_params)
        format.html { redirect_to shop_log_url(@shop_log), notice: "Shop log was successfully updated." }
        format.json { render :show, status: :ok, location: @shop_log }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @shop_log.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /shop_logs/1 or /shop_logs/1.json
  def destroy
    @shop_log.destroy

    respond_to do |format|
      format.html { redirect_to shop_logs_url, notice: "Shop log was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_shop_log
      @shop_log = ShopLog.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def shop_log_params
      params.require(:shop_log).permit(:shop_id, :action, :detail, :status, :add_time)
    end
end
