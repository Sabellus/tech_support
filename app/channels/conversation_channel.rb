class ConversationChannel < ApplicationCable::Channel
  def subscribed
    ticket_conversation_id = params[:id]
    ticket_conversation = TicketConversation.find_by(id: ticket_conversation_id)

    reject if ticket_conversation.blank?
    reject if ticket_conversation.client_id != current_user.id && ticket_conversation.manager_id != current_user.id

    stream_from "conversation:#{params[:id]}"
  end

  # def unsubscribed
  #   # stop_all_streams
  # end

  def receive(data)
    puts params.inspect
    
    # текст сообщения?
    # кто посылает?
    # кому посылает?
    # в какой ticket_conversation?

    # TODO: сохранение сообщения из data в постгрес
    ActionCable.server.broadcast("conversation:#{params[:id]}", data)
    # ActionCable.server.broadcast("user:#{first_user_id}", data)
    # ActionCable.server.broadcast("user:#{second_user_id}", data)
  end
end
