class HelpDeliveryOrderPlatformsController < ApplicationController
  before_action :set_help_delivery_order_platform, only: %i[ show edit update destroy ]

  # GET /help_delivery_order_platforms or /help_delivery_order_platforms.json
  def index
    @help_delivery_order_platforms = HelpDeliveryOrderPlatform.all
  end

  # GET /help_delivery_order_platforms/1 or /help_delivery_order_platforms/1.json
  def show
  end

  # GET /help_delivery_order_platforms/new
  def new
    @help_delivery_order_platform = HelpDeliveryOrderPlatform.new
  end

  # GET /help_delivery_order_platforms/1/edit
  def edit
  end

  # POST /help_delivery_order_platforms or /help_delivery_order_platforms.json
  def create
    @help_delivery_order_platform = HelpDeliveryOrderPlatform.new(help_delivery_order_platform_params)

    respond_to do |format|
      if @help_delivery_order_platform.save
        format.html { redirect_to help_delivery_order_platform_url(@help_delivery_order_platform), notice: "Help delivery order platform was successfully created." }
        format.json { render :show, status: :created, location: @help_delivery_order_platform }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @help_delivery_order_platform.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /help_delivery_order_platforms/1 or /help_delivery_order_platforms/1.json
  def update
    respond_to do |format|
      if @help_delivery_order_platform.update(help_delivery_order_platform_params)
        format.html { redirect_to help_delivery_order_platform_url(@help_delivery_order_platform), notice: "Help delivery order platform was successfully updated." }
        format.json { render :show, status: :ok, location: @help_delivery_order_platform }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @help_delivery_order_platform.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /help_delivery_order_platforms/1 or /help_delivery_order_platforms/1.json
  def destroy
    @help_delivery_order_platform.destroy

    respond_to do |format|
      format.html { redirect_to help_delivery_order_platforms_url, notice: "Help delivery order platform was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_help_delivery_order_platform
      @help_delivery_order_platform = HelpDeliveryOrderPlatform.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def help_delivery_order_platform_params
      params.require(:help_delivery_order_platform).permit(:help_delivery_order_id, :add_time, :image_directory, :detail)
    end
end
