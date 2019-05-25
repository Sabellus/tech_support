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
# Indexes
#
#  index_ticket_conversations_on_client_id   (client_id)
#  index_ticket_conversations_on_manager_id  (manager_id)
#
# Foreign Keys
#
#  fk_rails_...  (client_id => users.id)
#  fk_rails_...  (manager_id => users.id)
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
