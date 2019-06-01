module Entities
  class ConversationEntity < Grape::Entity
    expose :id
    expose :last_message do |instanse, options|
      last_message = instanse.messages.first
      Entities::MessageEntity.represent(last_message)
    end
    expose :status
    expose :updated_at
  end
end