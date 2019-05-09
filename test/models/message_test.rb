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
# Indexes
#
#  index_messages_on_ticket_conversation_id  (ticket_conversation_id)
#  index_messages_on_user_id                 (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (ticket_conversation_id => ticket_conversations.id)
#  fk_rails_...  (user_id => users.id)
#

require 'test_helper'

class MessageTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end