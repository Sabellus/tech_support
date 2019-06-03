module TechSupport
  class SupportConversations < Grape::API
    resource :support_conversations do
      post do
        authenticate!
        ticket_conversations = @user.ticket_conversations.includes(messages: [:user])        
        Entities::ConversationEntity.represent(ticket_conversations, :current_user => @user)    
      end 
      
      params do        
        requires :value, type: String        
      end      
      post :create do 
        authenticate! 
        ticket_params = { 
          client_id: current_user.id, messages_attributes: [
            { value: params[:value], user_id: current_user.id },            
          ]
        }    
        ticket_conversation = TicketConversation.new(ticket_params)       
        if ticket_conversation.save
          Entities::ConversationEntity.represent([ticket_conversation], :current_user => @user)
        else
          raise ServerError.new(ticket_conversation.errors.full_messages.join('; ')) 
        end          
      end 
    end
  end
end
