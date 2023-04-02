class BatchesController < ApplicationController
  before_action :find_course

  # before_action :set_batch, only: %i[ show edit update destroy ]
  before_action :set_batch, except: %i[ index new create ]

  # GET /batches or /batches.json
  def index
    @batches = @school.batches.all
  end

  # GET /batches/1 or /batches/1.json
  def show
    @total_pending_enrollments = @batch.enrollment_requests.pending.count
    @total_approved_enrollments = @batch.enrollment_requests.approved.count
  end

  # GET /batches/new
  def new
    @batch = @school.batches.new
  end

  # GET /batches/1/edit
  def edit
  end

  # POST /batches or /batches.json
  def create
    @batch = @course.batches.new(batch_params)

    respond_to do |format|
      if @batch.save
        format.html { redirect_to school_course_batch_url(@school, @course, @batch), notice: "Batch was successfully created." }
        format.json { render :show, status: :created, location: @batch }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @batch.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /batches/1 or /batches/1.json
  def update
    respond_to do |format|
      if @batch.update(batch_params)
        format.html { redirect_to school_course_batch_url(@school, @course, @batch), notice: "Batch was successfully updated." }
        format.json { render :show, status: :ok, location: @batch }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @batch.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /batches/1 or /batches/1.json
  def destroy
    @batch.destroy

    respond_to do |format|
      format.html { redirect_to school_course_batches_path(@school, @course), notice: "Batch was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def pending_enrollment_requests
    @pending_enrollment_requests = @batch.enrollment_requests.pending
  end

  def approved_students
    @approved_students = @batch.enrollment_requests.approved
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_batch
      @batch = @course.batches.find(params[:id])
    end

    def find_course
      @school = School.find(params[:school_id])
      @course = @school.courses.find(params[:course_id])
    end

    # Only allow a list of trusted parameters through.
    def batch_params
      params.require(:batch).permit(:name, :start_time, :end_time).merge!(school_id: @school.id)
    end
end
