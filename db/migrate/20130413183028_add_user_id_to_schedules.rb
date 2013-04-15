class AddUserIdToSchedules < ActiveRecord::Migration
  def change
    add_column :schedules, :user_account_id, :integer
  end
end
