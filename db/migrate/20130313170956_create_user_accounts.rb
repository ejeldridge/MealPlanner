class CreateUserAccounts < ActiveRecord::Migration
  def change
    create_table :user_accounts do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :salt
      t.string :password_hash
      t.string :session
      t.datetime :session_expire

      t.timestamps
    end
  end
end
