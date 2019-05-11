class ChangeDefaultRole < ActiveRecord::Migration[5.2]
  def up
    change_column :users, :role, :integer, :default => 1
  end
end
