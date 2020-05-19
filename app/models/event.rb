class Event < ApplicationRecord
  belongs_to :creator, class_name: "User"
  VALID_EMAIL_FORMAT = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i.freeze
  validates :name, presence: true, length: { minimum: 2, maximum: 30 }
  validates :email, presence: true, format: { with: VALID_EMAIL_FORMAT }, uniqueness: true
end
