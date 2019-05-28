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

class TicketComment < ApplicationRecord
  belongs_to :ticket_conversation
  belongs_to :user
end
