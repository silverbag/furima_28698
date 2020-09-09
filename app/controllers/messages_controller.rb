class MessagesController < ApplicationController

  def create
    @message = Message.new(messages_params)
    if @message.save
      ActionCable.server.broadcast 'message_channel', content: @message, user: @message.user.nickname
    else
       @message.destroy
    end
  end

  private

  def messages_params
    params.permit(:text, :item_id, :user_id).merge(user_id: current_user.id)
  end

end
