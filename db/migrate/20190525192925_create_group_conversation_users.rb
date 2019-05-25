class CreateGroupConversationUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :group_conversation_users do |t|
      t.references :group_conversation, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
