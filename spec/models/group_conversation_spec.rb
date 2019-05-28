# == Schema Information
#
# Table name: group_conversations
#
#  id         :bigint(8)        not null, primary key
#  author_id  :bigint(8)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'rails_helper'

RSpec.describe GroupConversation, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
