class Schedule < ActiveRecord::Base
  EVENT_TYPES = {"Breakfast" => 1, "Lunch" => 2, "Dinner" => 3}

  attr_accessible :event_date, :event_type
  has_many :recipes
  has_many :user_accounts

  def event_type_str
    Schedule::resolve_event_type(event_type)
  end

  def self.resolve_event_type type
    entry = EVENT_TYPES.find do |k,v|
      v == type
    end

    return entry if entry.nil?
    entry[0]
  end
end
