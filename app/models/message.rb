# == Schema Information
#
# Table name: messages
#
#  id                     :bigint(8)        not null, primary key
#  ticket_conversation_id :bigint(8)
#  user_id                :bigint(8)
#  value                  :text
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#

class Message < ApplicationRecord
  belongs_to :ticket_conversation, touch: true
  belongs_to :user
  validates :value, presence: true

  # after_create :send_to_channels

  # def send_to_channels
  #   binding.pry
  #   ActionCable.server.broadcast("conversation:#{ticket_conversation_id}", value)
  # end
end
