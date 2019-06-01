require 'server_error'

Dir.glob(Rails.root.join('app/api/entities/*')).each { |x| require x }

class TechSupportAPI < Grape::API 
  helpers do
    def authenticate
      authorization_header = headers["Authorization"]
      return false if authorization_header.blank?
      token = authorization_header.split(' ').last
      email, authentication_token = Base64.decode64(token).split(':')

      @user = email && User.find_by(email: email)
      if @user && Devise.secure_compare(@user.authentication_token, authentication_token)
        true
      else
        false
      end
    end

    def current_user
      @user
    end

    def authenticate!
      raise_sessions_incorrect if !authenticate
    end

    def raise_sessions_incorrect
      raise ::ServerError.new('token incorrect')
    end

    def permitted_params
      @permitted_params ||= declared(params)
    end
  end

  prefix 'api'
  format :json

  rescue_from ::ServerError do |e|
    error!({
      error: { message: e.message }
    }, 400)
  end

  mount TechSupport::Conversations
  mount TechSupport::Sessions
  mount TechSupport::TechMessages
end