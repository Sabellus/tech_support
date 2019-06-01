module TechSupport
  class Conversations < Grape::API
    resource :conversations do
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

        Entities::ConversationEntity.represent(result)
      end

      params do
        requires :type_name
      end
      post do
        declared_params = declared(params)
        
        {
          declared: declared_params,
          params: params,
        }
      end
    end
  end
end

# POST: /api/signin
# POST: /api/signup

# GET: /api/conversations


# POST: /api/conversations
# support
# client
# group

# WS по ticket_conversation_id

# POST: /api/rating


