class CreateSchedules < ActiveRecord::Migration
  def change
    create_table :schedules do |t|
      t.integer :event_type
      t.date :event_date
    end
  end
end
