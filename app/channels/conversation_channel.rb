class ConversationChannel < ApplicationCable::Channel
  def subscribed
    stream_from "conversation:#{params[:id]}"
  end

  def unsubscribed
    stop_all_streams
  end

  def receive(data)
    puts params.inspect
    # TODO: сохранение сообщения из data в постгрес
    ActionCable.server.broadcast("conversation:#{params[:id]}", data)
  end
end
