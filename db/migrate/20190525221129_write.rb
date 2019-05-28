class Write < ActiveRecord::Migration[5.2]
  def change
    User.all.find_each do |user|
      user.ensure_authentication_token
      user.save
    end
  end
end
