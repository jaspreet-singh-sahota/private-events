class User < ApplicationRecord
  has_many :events, foreign_key: "creator_id", class_name: "Event"
  validates :title, presence: true, length: { minimum: 5 }
  validates :description, presence: true, length: { minimum: 10, maximum: 100 }
end
