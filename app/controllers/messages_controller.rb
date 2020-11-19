class MessagesController < ApplicationController

  def create
    @message = Message.new(message_params)
    if @message.save
      ActionCable.server.broadcast 'message_channel', content: @message
    end
  end

  def show
    @messages = Message.all
    @tutor = Tutor.find(params[:id])
    @user = current_user.id
  end

  private

  def message_params
    params.require(:message).permit(:content, :tutor_id).merge(user_id: current_user.id)
  end
end
