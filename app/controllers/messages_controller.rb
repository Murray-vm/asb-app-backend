class MessagesController < ApplicationController
  skip_before_action :authenticate
  before_action :set_message, only: [:show, :edit, :update, :destroy]

  # GET /messages
  def index
    @messages = Message.all
    render json: @messages
  end

  # GET /messages/:id
  def show
  end

  # GET /messages/new
  def new
    @message = Message.new
  end

  # POST /messages
  def create
    @message = Message.new(message_params)
    if @message.save
      redirect_to @message, notice: 'Message was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  # GET /messages/:id/edit
  def edit
  end

  # PATCH/PUT /messages/:id
  def update
    if @message.update(message_params)
      redirect_to @message, notice: 'Message was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /messages/:id
  def destroy
    @message.destroy
    redirect_to messages_url, notice: 'Message was successfully destroyed.'
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_message
    @message = Message.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def message_params
    params.require(:message).permit(:content, :user)
  end
end
