class RoomsController < ApplicationController
  
  def new
    @room = Room.new
  end

  def create
    @room = Room.create(room_params)
  end

  def show
    @room = Room.new(room_params)
    @messages = @room.messages
  end

  private

  def room_params
    params.require(:room).permit(:message_id, :user_id, :tutor_id)
  end
end
