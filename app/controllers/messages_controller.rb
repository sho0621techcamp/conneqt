class MessagesController < ApplicationController

  def create
    @message = Message.new(message_params)
    if @message.save
      ActionCable.server.broadcast 'message_channel', content: @message
    end
  end

  def show
    @messages = Message.includes(:user, :tutor)
    # @message = Message.find(params[:id])
    @tutor = Tutor.find(params[:id])
    @user = User.find(params[:id])
    @message = Message.create
  end

  private

  def message_params
    params.require(:message).permit(:content, :user_id, :tutor_id, :image, :room_id).merge(user_id: current_user.id, tutor_id: current_tutor.id)
  end
end
