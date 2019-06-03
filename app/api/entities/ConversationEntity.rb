module Entities
  class ConversationEntity < Grape::Entity
    expose :id
    expose :messages do |instanse, options|      
      if options[:type] == :short
        last_message = instanse.messages.first
        Entities::MessageEntity.represent([last_message])
      else 
        Entities::MessageEntity.represent(instanse.messages, :current_user => options[:current_user])
      end 
      
    end
    expose :status
    expose :updated_at
  end
end