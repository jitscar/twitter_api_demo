class API::V1::MessagesController < ApplicationController

  def index
    @messages = Message.all

    respond_to do |format|
      format.json { render json: @messages }
    end
  end

  def create
    @message = Message.new(message_params)

    respond_to do |format|
      if @message.save
        format.json { render json: @message }
      else
        format.json { render json: @message.errors }
      end
    end
  end

  private

  def message_params
    params.require(:message).permit(:content, :user_id)
  end
end
