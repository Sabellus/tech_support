module TechSupport
  class Sessions < Grape::API     
    params do
      requires :email, type: String
      requires :password, type: String
    end
    post :signin do      
      user = User.find_for_authentication(email: permitted_params[:email])

      raise ServerError.new('no such user') if user.blank?

      if user.valid_password?(permitted_params[:password])
        status 200
        Entities::UserEntity.represent(user, full: true)
      else 
        raise ServerError.new('password is incorrect') 
      end   
    end

    params do
      requires :user, type: Hash do 
        requires :email, type: String
        requires :password, type: String
        requires :password_confirmation, type: String
      end
    end
    post :signup do     
      user = User.new(permitted_params[:user])
      if user.save
        Entities::UserEntity.represent(user, full: true)
      else
        raise ServerError.new(user.errors.full_messages.join('; ')) 
      end      
    end
  end
end
