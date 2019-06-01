module TechSupport
  class TechMessages < Grape::API
    resource :messages do
      get do
        authenticate!

        ticket_conversations = @user.ticket_conversations
        
        
        result = [
          *ticket_conversations.includes(messages: [:user]).where(
            messages: { id: Message.select('max(id)').where(ticket_conversation_id: ticket_conversations.select(:id)) }
          ),
          # *@user.group_conversations,
          # *@user.client_conversations
        ]
        result2 = [
          *ticket_conversations.includes(messages: [:user])       
        ]
       
        Entities::ConversationMessagesEntity.represent(result2)
      end     
    end
  end
end
