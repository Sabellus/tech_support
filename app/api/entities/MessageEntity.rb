module Entities
  class MessageEntity < Grape::Entity
    expose :id
    expose :value
    expose :user do |instance, options|
      Entities::UserEntity.represent(instance.user)
    end
  end
end