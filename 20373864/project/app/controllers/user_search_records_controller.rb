class UserSearchRecordsController < ApplicationController
  before_action :set_user_search_record, only: %i[ show edit update destroy ]

  # GET /user_search_records or /user_search_records.json
  def index
    @user_search_records = UserSearchRecord.all
  end

  # GET /user_search_records/1 or /user_search_records/1.json
  def show
  end

  # GET /user_search_records/new
  def new
    @user_search_record = UserSearchRecord.new
  end

  # GET /user_search_records/1/edit
  def edit
  end

  # POST /user_search_records or /user_search_records.json
  def create
    @user_search_record = UserSearchRecord.new(user_search_record_params)

    respond_to do |format|
      if @user_search_record.save
        format.html { redirect_to user_search_record_url(@user_search_record), notice: "User search record was successfully created." }
        format.json { render :show, status: :created, location: @user_search_record }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @user_search_record.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /user_search_records/1 or /user_search_records/1.json
  def update
    respond_to do |format|
      if @user_search_record.update(user_search_record_params)
        format.html { redirect_to user_search_record_url(@user_search_record), notice: "User search record was successfully updated." }
        format.json { render :show, status: :ok, location: @user_search_record }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @user_search_record.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /user_search_records/1 or /user_search_records/1.json
  def destroy
    @user_search_record.destroy

    respond_to do |format|
      format.html { redirect_to user_search_records_url, notice: "User search record was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user_search_record
      @user_search_record = UserSearchRecord.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def user_search_record_params
      params.require(:user_search_record).permit(:user_id, :content, :add_time)
    end
end
