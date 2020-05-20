class Event < ApplicationRecord
  belongs_to :creator, class_name: "User"
  has_many :invitations, foreign_key: :attended_event_id  
  has_many :attendees , through: :invitations

  validates :title , presence: true, length: { minimum: 3, maximum: 25 }
  validates :description , presence: true, length: { minimum: 3, maximum: 1000 }

  # upcoming events  and past event
    scope :upcoming_events, -> { where('event_date >= ?', Time.zone.now) }
    scope :previous_events, -> { where('event_date < ?', Time.zone.now) } 
end
