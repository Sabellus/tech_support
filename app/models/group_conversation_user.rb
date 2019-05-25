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
# Indexes
#
#  index_group_conversation_users_on_group_conversation_id  (group_conversation_id)
#  index_group_conversation_users_on_user_id                (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (group_conversation_id => group_conversations.id)
#  fk_rails_...  (user_id => users.id)
#

class GroupConversationUser < ApplicationRecord
  belongs_to :group_conversation
  belongs_to :user
end
