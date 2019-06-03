class ChangeStatus < ActiveRecord::Migration[5.2]
  def up
    change_column :ticket_conversations, :status, :integer, :default =>  0   
  end
end

