# == Schema Information
#
# Table name: ticket_conversations
#
#  id         :bigint(8)        not null, primary key
#  client_id  :bigint(8)
#  manager_id :bigint(8)
#  status     :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class TicketConversation < ApplicationRecord
  enum status: {
    "Создан": 0,
    "В обработке": 1,
    "Завершен": 2
  }
  
  audited
  belongs_to :client, class_name: 'User'
  belongs_to :manager, class_name: 'User', optional: true

  has_many :messages, dependent: :destroy

  accepts_nested_attributes_for :messages
end
