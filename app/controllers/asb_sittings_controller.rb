class AsbSittingsController < ApplicationController
  skip_before_action :authenticate
  before_action :set_asb_sitting, only: %i[ show update destroy ]

  # GET /asb_sittings
  def index
    @asb_sittings = AsbSitting.all

    render json: @asb_sittings
  end

  # GET /asb_sittings/1
  def show
    render json: @asb_sitting
  end

  # POST /asb_sittings
  def create
    @asb_sitting = AsbSitting.new(asb_sitting_params)

    if @asb_sitting.save
      render json: @asb_sitting, status: :created, location: @asb_sitting
    else
      render json: @asb_sitting.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /asb_sittings/1
  # def update
  #   if @asb_sitting.update(asb_sitting_params)
  #     # Broadcast to the channel whenever a sitting is updated
  #     ActionCable.server.broadcast "sessions_channel", {
  #       current_section: @asb_sitting.current_section,
  #       session_id: @asb_sitting.id
  #     }
  #     render json: @asb_sitting
  #   else
  #     render json: @asb_sitting.errors, status: :unprocessable_entity
  #   end
  # end
  


  def update
    if @asb_sitting.update(asb_sitting_params)
      # Broadcast to all subscribers of the session
      SessionsChannel.broadcast_to(
        @asb_sitting.id, # session_id is the identifier for the stream
        current_section: @asb_sitting.current_section,
        session_id: @asb_sitting.id
      )
      render json: @asb_sitting
    else
      render json: @asb_sitting.errors, status: :unprocessable_entity
    end
  end
  
  

  # DELETE /asb_sittings/1
  def destroy
    @asb_sitting.destroy!
  end

  def active_students
    # session_id = params[:session_id]
    # student_ids = REDIS_CLIENT.smembers("session_#{session_id}_students")
    # render json: { student_ids: student_ids }
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_asb_sitting
      @asb_sitting = AsbSitting.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def asb_sitting_params
      params.require(:asb_sitting).permit(:user_id, :current_section)
    end
end
