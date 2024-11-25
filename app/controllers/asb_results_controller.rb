class AsbResultsController < ApplicationController
  skip_before_action :authenticate
  before_action :set_asb_result, only: %i[ show update destroy ]

  # GET /asb_results
  def index
    @asb_results = AsbResult.all

    render json: @asb_results
  end

  # GET /asb_results/1
  def show
    render json: @asb_result
  end

  # POST /asb_results
  def create
    @asb_result = AsbResult.new(asb_result_params)

    if @asb_result.save
      render json: @asb_result, status: :created, location: @asb_result
    else
      render json: @asb_result.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /asb_results/1
  def update
    if @asb_result.update(asb_result_params)
      render json: @asb_result
    else
      render json: @asb_result.errors, status: :unprocessable_entity
    end
  end

  # DELETE /asb_results/1
  def destroy
    @asb_result.destroy!
  end

  def by_sitting
    def by_sitting
      asb_sitting_id = params[:asb_sitting_id]
      @results = AsbResult
                   .joins(:student) # Join the students table
                   .where(asb_sitting_id: asb_sitting_id)
                   .select('asb_results.*, students.username as student_username') # Include fields from students
  
      render json: @results, status: :ok
    rescue ActiveRecord::RecordNotFound
      render json: { error: 'Results not found' }, status: :not_found
    end
  end
  

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_asb_result
      @asb_result = AsbResult.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def asb_result_params
      params.require(:asb_result).permit(:asb_sitting_id, :student_id, :result)
    end
end
