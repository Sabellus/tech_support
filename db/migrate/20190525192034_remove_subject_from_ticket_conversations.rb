class RemoveSubjectFromTicketConversations < ActiveRecord::Migration[5.2]
  def change
    remove_column :ticket_conversations, :subject, :string
  end
end
