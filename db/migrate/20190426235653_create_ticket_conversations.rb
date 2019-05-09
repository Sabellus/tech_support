class CreateTicketConversations < ActiveRecord::Migration[5.2]
  def change
    create_table :ticket_conversations do |t|
      t.string :subject
      t.references :client, foreign_key: { to_table: :users }
      t.references :manager, foreign_key: { to_table: :users }
      t.integer :status

      t.timestamps
    end
  end
end
