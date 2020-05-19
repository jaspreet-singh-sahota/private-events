class User < ApplicationRecord
  has_many :events, foreign_key: "creator_id", class_name: "Events"
end
