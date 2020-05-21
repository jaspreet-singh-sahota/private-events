class User < ApplicationRecord
  has_many :events, foreign_key: "creator_id", class_name: "Event"
  has_many :invitations, foreign_key: :attendee_id  
  has_many :attended_events , through: :invitations 
  VALID_EMAIL_ID = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i.freeze
  validates :name, presence: true, length: { minmum: 2, maixmum: 30 }
  validates :email, presence: true, length: { minmum: 2, maixmum: 30 }, format: { with: VALID_EMAIL_ID }
end
