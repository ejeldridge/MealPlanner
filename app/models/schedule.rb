class Schedule < ActiveRecord::Base
  EVENT_TYPES = {"Breakfast" => 1, "Lunch" => 2, "Dinner" => 3}

  attr_accessible :event_date, :event_type, :recipe_id, :user_account_id
  belongs_to :recipe
  belongs_to :user_account

  delegate :recipe_name, :to => :recipe

  validates :recipe_id, :presence => true
  validates :user_account_id, :presence => true

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

  def self.search_by_date(date)
    self.find_all_by_event_date(date)
  end
end
