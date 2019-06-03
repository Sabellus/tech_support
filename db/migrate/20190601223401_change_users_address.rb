class ChangeUsersAddress < ActiveRecord::Migration[5.2]
  def up
    change_column :users, :address, :string, :default =>  ""
    change_column :users, :first_name, :string, :default => ""
    change_column :users, :last_name, :string, :default => ""
    change_column :users, :gender, :integer, :default => 0
    change_column :users, :phone, :string, :default => ""
  end
end

