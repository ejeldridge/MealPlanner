class AddUserNameToUserAccounts < ActiveRecord::Migration
  def change
    add_column :user_accounts, :user_name, :string
  end
end
