class HelpDeliveryItemsController < ApplicationController
  before_action :set_help_delivery_item, only: %i[ show edit update destroy ]

  # GET /help_delivery_items or /help_delivery_items.json
  def index
    @help_delivery_items = HelpDeliveryItem.all
  end

  # GET /help_delivery_items/1 or /help_delivery_items/1.json
  def show
  end

  # GET /help_delivery_items/new
  def new
    @help_delivery_item = HelpDeliveryItem.new
  end

  # GET /help_delivery_items/1/edit
  def edit
  end

  # POST /help_delivery_items or /help_delivery_items.json
  def create
    @help_delivery_item = HelpDeliveryItem.new(help_delivery_item_params)

    respond_to do |format|
      if @help_delivery_item.save
        format.html { redirect_to help_delivery_item_url(@help_delivery_item), notice: "Help delivery item was successfully created." }
        format.json { render :show, status: :created, location: @help_delivery_item }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @help_delivery_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /help_delivery_items/1 or /help_delivery_items/1.json
  def update
    respond_to do |format|
      if @help_delivery_item.update(help_delivery_item_params)
        format.html { redirect_to help_delivery_item_url(@help_delivery_item), notice: "Help delivery item was successfully updated." }
        format.json { render :show, status: :ok, location: @help_delivery_item }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @help_delivery_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /help_delivery_items/1 or /help_delivery_items/1.json
  def destroy
    @help_delivery_item.destroy

    respond_to do |format|
      format.html { redirect_to help_delivery_items_url, notice: "Help delivery item was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_help_delivery_item
      @help_delivery_item = HelpDeliveryItem.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def help_delivery_item_params
      params.require(:help_delivery_item).permit(:user_id, :detail, :help_delivery_order_id)
    end
end
