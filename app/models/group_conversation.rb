# == Schema Information
#
# Table name: group_conversations
#
#  id         :bigint(8)        not null, primary key
#  author_id  :bigint(8)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_group_conversations_on_author_id  (author_id)
#
# Foreign Keys
#
#  fk_rails_...  (author_id => users.id)
#

class GroupConversation < ApplicationRecord
  belongs_to :author
end
