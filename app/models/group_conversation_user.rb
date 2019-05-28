# == Schema Information
#
# Table name: group_conversation_users
#
#  id                    :bigint(8)        not null, primary key
#  group_conversation_id :bigint(8)
#  user_id               :bigint(8)
#  created_at            :datetime         not null
#  updated_at            :datetime         not null
#

class GroupConversationUser < ApplicationRecord
  belongs_to :group_conversation
  belongs_to :user
end
