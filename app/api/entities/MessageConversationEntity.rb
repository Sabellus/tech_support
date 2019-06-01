module Entities
  class MessageConversationEntity < Grape::Entity
    expose :messages do |instanse, options|      
      Entities::MessageEntity.represent(instanse)            
    end    
  end
end