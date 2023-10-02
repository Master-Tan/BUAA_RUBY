class DeliverLogsController < ApplicationController
  before_action :set_deliver_log, only: %i[ show edit update destroy ]

  # GET /deliver_logs or /deliver_logs.json
  def index
    @deliver_logs = DeliverLog.all
  end

  # GET /deliver_logs/1 or /deliver_logs/1.json
  def show
  end

  # GET /deliver_logs/new
  def new
    @deliver_log = DeliverLog.new
  end

  # GET /deliver_logs/1/edit
  def edit
  end

  # POST /deliver_logs or /deliver_logs.json
  def create
    @deliver_log = DeliverLog.new(deliver_log_params)

    respond_to do |format|
      if @deliver_log.save
        format.html { redirect_to deliver_log_url(@deliver_log), notice: "Deliver log was successfully created." }
        format.json { render :show, status: :created, location: @deliver_log }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @deliver_log.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /deliver_logs/1 or /deliver_logs/1.json
  def update
    respond_to do |format|
      if @deliver_log.update(deliver_log_params)
        format.html { redirect_to deliver_log_url(@deliver_log), notice: "Deliver log was successfully updated." }
        format.json { render :show, status: :ok, location: @deliver_log }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @deliver_log.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /deliver_logs/1 or /deliver_logs/1.json
  def destroy
    @deliver_log.destroy

    respond_to do |format|
      format.html { redirect_to deliver_logs_url, notice: "Deliver log was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_deliver_log
      @deliver_log = DeliverLog.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def deliver_log_params
      params.require(:deliver_log).permit(:deliver_id, :action, :detail, :status, :add_time)
    end
end
