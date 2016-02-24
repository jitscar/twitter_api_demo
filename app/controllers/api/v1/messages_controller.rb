module API
  module V1
    class MessagesController < ApiController
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

      def favorite
        @message = Message.find(params[:id])
        User.current.add_message_to_favorites(@message)

        respond_to do |format|
          format.json { render json: @message, status: :ok }
        end
      end

      private

      def message_params
        params.require(:message).permit(:content, :user_id)
      end
    end
  end
end
