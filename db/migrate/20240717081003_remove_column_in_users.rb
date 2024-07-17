class RemoveColumnInUsers < ActiveRecord::Migration[7.1]
  def change
    remove_column :users, :user_id
  end
end
