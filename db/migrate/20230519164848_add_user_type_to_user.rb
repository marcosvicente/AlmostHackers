class AddUserTypeToUser < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :user_type, :string, null: false
  end
end
