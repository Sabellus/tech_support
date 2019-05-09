# == Schema Information
#
# Table name: ticket_comments
#
#  id                     :bigint(8)        not null, primary key
#  ticket_conversation_id :bigint(8)
#  user_id                :bigint(8)
#  title                  :string
#  description            :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_ticket_comments_on_ticket_conversation_id  (ticket_conversation_id)
#  index_ticket_comments_on_user_id                 (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (ticket_conversation_id => ticket_conversations.id)
#  fk_rails_...  (user_id => users.id)
#

require 'test_helper'

class TicketCommentTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
