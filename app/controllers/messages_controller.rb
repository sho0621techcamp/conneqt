class MessagesController < ApplicationController
  
  def new
    @messages = Message.all
    @message = Message.new
  end

  def create
    @message = Message.new(message_params)
    if @message.save
      ActionCable.server.broadcast 'message_channel', content: @message
    end
  end

  def show
    @messages = Message.all
  end

  private

  def message_params
    params.require(:message).permit(:content).merge(user_id: current_user.id, tutor_id: current_tutor.id)
  end
end
