# == Schema Information
#
# Table name: users
#
#  id                     :bigint(8)        not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  role                   :integer          default("client")
#  first_name             :string
#  last_name              :string
#  gender                 :integer
#  phone                  :string
#  address                :string
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  authentication_token   :string
#

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  before_save :ensure_authentication_token
  
  enum gender: {
    "Мужской": 0,
    "Женский": 1,
  }

  enum role: {
    manager: 0,
    client: 1,
    admin: 2,
  }

  def ticket_conversations
    TicketConversation.where('client_id = ? OR manager_id = ?', id, id)
  end

  def group_conversations
    GroupConversation.joins(:group_conversation_users).where(group_conversation_users: { user_id: id })
  end

  def client_conversations
    ClientConversation.where('from_client_id = ? OR to_client_id = ?', id, id)
  end
  
  def name
    "#{first_name} #{last_name}"
  end

  def public_token
    Base64.encode64("#{email}:#{authentication_token}").strip
  end
  
  def ensure_authentication_token
    if authentication_token.blank?
      self.authentication_token = generate_authentication_token
    end
  end

  private

    def generate_authentication_token
      loop do
        token = Devise.friendly_token
        break token unless User.where(authentication_token: token).first
      end
    end
end
