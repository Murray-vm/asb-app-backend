class AnswersController < ApplicationController
  skip_before_action :authenticate
  before_action :set_answer, only: %i[ show update destroy ]

  # GET /answers
  def index
    @answers = Answer.all

    render json: @answers
  end

  # GET /answers/1
  def show
    render json: @answer
  end

  # POST /answers
  def create
    @answer = Answer.new(answer_params)

    if @answer.save
      render json: @answer, status: :created, location: @answer
    else
      render json: @answer.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /answers/1
  def update
    if @answer.update(answer_params)
      render json: @answer
    else
      render json: @answer.errors, status: :unprocessable_entity
    end
  end

  # DELETE /answers/1
  def destroy
    @answer.destroy!
  end

  def fetch_by_student_and_sitting
    student_id = params[:student_id]
    asb_sitting_id = params[:asb_sitting_id]

    # Adjust the model and associations as per your schema
    @answers = Answer.where(student_id: student_id, asb_sitting_id: asb_sitting_id)

    if @answers.present?
      render json: @answers, status: :ok
    else
      render json: { error: 'No answers found' }, status: :not_found
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_answer
      @answer = Answer.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def answer_params
      params.require(:answer).permit(:asb_sitting_id, :student_id, :correct, :lines, :question, :marks)
    end
end
