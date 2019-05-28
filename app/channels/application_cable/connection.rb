module ApplicationCable
  class Connection < ActionCable::Connection::Base
    identified_by :current_user

    def connect
      self.current_user = find_verified_user

      puts self.current_user.id
    end

    private
      def find_verified_user
        authorization_header = request.headers["Authorization"]
        token = authorization_header.split(' ').last
        email, authentication_token = Base64.decode64(token).split(':')

        user = email && User.find_by(email: email)
        if user && Devise.secure_compare(user.authentication_token, authentication_token)
          user
        else
          reject_unauthorized_connection
        end
      end
  end
end
