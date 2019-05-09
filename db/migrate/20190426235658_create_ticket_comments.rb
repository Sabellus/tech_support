class CreateTicketComments < ActiveRecord::Migration[5.2]
  def change
    create_table :ticket_comments do |t|
      t.references :ticket_conversation, foreign_key: true
      t.references :user, foreign_key: true
      t.string :title
      t.string :description

      t.timestamps
    end
  end
end
