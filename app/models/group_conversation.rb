# == Schema Information
#
# Table name: group_conversations
#
#  id         :bigint(8)        not null, primary key
#  author_id  :bigint(8)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class GroupConversation < ApplicationRecord
  belongs_to :author
  has_many :group_conversation_users
end
