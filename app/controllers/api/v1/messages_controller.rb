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
        format.json { render json: @message, status: :created }
      else
        format.json { render json: @message.errors, status: :unprocessable_entity }
      end
    end
  end

  def mark_as_liked
    @message = Message.find(params[:id])

    respond_to do |format|
      format.json { render json: @message, status: :ok } if @message.update(like: true)
    end
  end

  private

  def message_params
    params.require(:message).permit(:content, :user_id)
  end
end
