class AdministratorLogsController < ApplicationController
  before_action :set_administrator_log, only: %i[ show edit update destroy ]

  # GET /administrator_logs or /administrator_logs.json
  def index
    if session[:current_administrator_id]
      if Administrator.find(session[:current_administrator_id])[:level] == 1
        @administrator_logs = AdministratorLog.all
      else
        api_error(status: 402)
      end
    else
      api_error(status: 402)
    end
  end

  # GET /administrator_logs/1 or /administrator_logs/1.json
  def show
  end

  # GET /administrator_logs/new
  def new
    @administrator_log = AdministratorLog.new
  end

  # GET /administrator_logs/1/edit
  def edit
  end

  # POST /administrator_logs or /administrator_logs.json
  def create
    @administrator_log = AdministratorLog.new(administrator_log_params)

    respond_to do |format|
      if @administrator_log.save
        format.html { redirect_to administrator_log_url(@administrator_log), notice: "Administrator log was successfully created." }
        format.json { render :show, status: :created, location: @administrator_log }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @administrator_log.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /administrator_logs/1 or /administrator_logs/1.json
  def update
    respond_to do |format|
      if @administrator_log.update(administrator_log_params)
        format.html { redirect_to administrator_log_url(@administrator_log), notice: "Administrator log was successfully updated." }
        format.json { render :show, status: :ok, location: @administrator_log }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @administrator_log.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /administrator_logs/1 or /administrator_logs/1.json
  def destroy
    @administrator_log.destroy

    respond_to do |format|
      format.html { redirect_to administrator_logs_url, notice: "Administrator log was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_administrator_log
      @administrator_log = AdministratorLog.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def administrator_log_params
      params.require(:administrator_log).permit(:administrator_id, :action, :detail, :status, :add_time)
    end
end
