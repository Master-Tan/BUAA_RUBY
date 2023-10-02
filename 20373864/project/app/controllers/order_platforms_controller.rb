class OrderPlatformsController < ApplicationController
  before_action :set_order_platform, only: %i[ show edit update destroy ]

  # GET /order_platforms or /order_platforms.json
  def index
    @order_platforms = OrderPlatform.all
  end

  # GET /order_platforms/1 or /order_platforms/1.json
  def show
  end

  # GET /order_platforms/new
  def new
    @order_platform = OrderPlatform.new
  end

  # GET /order_platforms/1/edit
  def edit
  end

  # POST /order_platforms or /order_platforms.json
  def create
    @order_platform = OrderPlatform.new(order_platform_params)

    respond_to do |format|
      if @order_platform.save
        format.html { redirect_to order_platform_url(@order_platform), notice: "Order platform was successfully created." }
        format.json { render :show, status: :created, location: @order_platform }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @order_platform.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /order_platforms/1 or /order_platforms/1.json
  def update
    respond_to do |format|
      if @order_platform.update(order_platform_params)
        format.html { redirect_to order_platform_url(@order_platform), notice: "Order platform was successfully updated." }
        format.json { render :show, status: :ok, location: @order_platform }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @order_platform.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /order_platforms/1 or /order_platforms/1.json
  def destroy
    @order_platform.destroy

    respond_to do |format|
      format.html { redirect_to order_platforms_url, notice: "Order platform was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order_platform
      @order_platform = OrderPlatform.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def order_platform_params
      params.require(:order_platform).permit(:transaction_order_id, :add_time, :image_directory, :detail)
    end
end
