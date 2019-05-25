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
# Indexes
#
#  index_client_conversations_on_from_client_id  (from_client_id)
#  index_client_conversations_on_to_client_id    (to_client_id)
#
# Foreign Keys
#
#  fk_rails_...  (from_client_id => users.id)
#  fk_rails_...  (to_client_id => users.id)
#

class ClientConversation < ApplicationRecord
  belongs_to :from_client
  belongs_to :to_client
end
