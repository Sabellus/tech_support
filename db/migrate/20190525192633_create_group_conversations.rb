class CreateGroupConversations < ActiveRecord::Migration[5.2]
  def change
    create_table :group_conversations do |t|
      t.references :author, foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end
