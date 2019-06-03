module Entities
  class ConversationMessagesEntity < Grape::Entity
    expose :id
    expose :value do |instanse, options|      
      instanse.messages do |i, o|
        Entities::MessageEntity.represent(i)
      end
    end
    expose :status
    expose :updated_at
  end
end