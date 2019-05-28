# == Schema Information
#
# Table name: client_conversations
#
#  id             :bigint(8)        not null, primary key
#  from_client_id :bigint(8)
#  to_client_id   :bigint(8)
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

class ClientConversation < ApplicationRecord
  belongs_to :from_client
  belongs_to :to_client
end
