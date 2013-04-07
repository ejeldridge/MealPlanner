class CreateSchedules < ActiveRecord::Migration
  def change
    create_table :schedules do |t|
      t.date :event_date
      t.integer :event_type
    end
  end
end
