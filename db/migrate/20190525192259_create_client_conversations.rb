class CreateClientConversations < ActiveRecord::Migration[5.2]
  def change
    create_table :client_conversations do |t|
      t.references :from_client, foreign_key: { to_table: :users }
      t.references :to_client, foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end
