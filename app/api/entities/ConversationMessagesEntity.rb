module Entities
  class ConversationMessagesEntity < Grape::Entity
    expose :id
    expose :value do |instanse, options|      
      Entities::MessageConversationEntity.represent(instanse.messages)
    end
    expose :status
    expose :updated_at
  end
end