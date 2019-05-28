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

require 'rails_helper'

RSpec.describe GroupConversationUser, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
