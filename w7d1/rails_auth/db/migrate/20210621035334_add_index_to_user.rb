class AddIndexToUser < ActiveRecord::Migration[5.2]
  def change
    add_index :users, [:id, :username], unique: true
    change_column_null :users, :username, false
    change_column_null :users, :password_digest, false
    change_column_null :users, :session_token, false
  end
end
