# == Schema Information
#
# Table name: ticket_conversations
#
#  id         :bigint(8)        not null, primary key
#  subject    :string
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

require 'test_helper'

class TicketConversationTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end