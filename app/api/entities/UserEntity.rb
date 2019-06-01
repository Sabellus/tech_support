module Entities
  class UserEntity < Grape::Entity
    expose :id
    expose :email
    # expose :role
    expose :first_name
    expose :last_name
    expose :gender
    expose :phone
    expose :address
    # expose :reset_password_token
    # expose :reset_password_sent_at
    # expose :remember_created_at
    expose :created_at
    # expose :updated_at
    expose :token, if: lambda { |instance, options| !!options[:full] } do |instance, options|
      instance.public_token
    end
  end
end
