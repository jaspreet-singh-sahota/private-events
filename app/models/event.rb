class Event < ApplicationRecord
  belongs_to :creator, class_name: "User"
  has_many :attendees , throught: :event_attendence , source: :event_attendee
end
