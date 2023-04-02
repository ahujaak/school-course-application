class EnrollmentRequestsController < ApplicationController
  before_action :find_batch
  before_action :set_enrollment_request, only: %i[ show edit update destroy  ]

  # GET /enrollment_requests or /enrollment_requests.json
  def index
    @enrollment_requests = @batch.enrollment_requests.all
  end

  # GET /enrollment_requests/1 or /enrollment_requests/1.json
  def show
  end

  # GET /enrollment_requests/new
  def new
    @enrollment_request = @batch.enrollment_requests.new
  end

  # GET /enrollment_requests/1/edit
  def edit
  end

  # POST /enrollment_requests or /enrollment_requests.json
  def create
    @enrollment_request = @batch.enrollment_requests.new(enrollment_request_params)

    respond_to do |format|
      if @enrollment_request.save
        @enrollment_request.approve!(current_user.id) unless current_user.student?
        format.html { redirect_to batch_enrollment_request_url(@batch, @enrollment_request), notice: "Enrollment request was successfully created." }
        format.json { render :show, status: :created, location: @enrollment_request }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @enrollment_request.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /enrollment_requests/1 or /enrollment_requests/1.json
  def update
    respond_to do |format|
      if @enrollment_request.update(enrollment_request_params)
        format.html { redirect_to batch_enrollment_request_url(@batch, @enrollment_request), notice: "Enrollment request was successfully updated." }
        format.json { render :show, status: :ok, location: @enrollment_request }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @enrollment_request.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /enrollment_requests/1 or /enrollment_requests/1.json
  def destroy
    @enrollment_request.destroy

    respond_to do |format|
      format.html { redirect_to batch_enrollment_requests_url(@batch), notice: "Enrollment request was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def approve
    @enrollment_request.approve!(current_user.id)
  end

  def decline
    @enrollment_request.decline!
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_enrollment_request
      @enrollment_request = EnrollmentRequest.find(params[:id])
    end

    def find_batch
      @batch = Batch.find(params[:batch_id])
    end

    # Only allow a list of trusted parameters through.
    def enrollment_request_params
      params.require(:enrollment_request).permit(:batch_id, :student_id, :status)
    end
end
