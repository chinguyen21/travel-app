class Destination < ApplicationRecord
    has_many :events
    has_many :user_destinations
    has_many :users, through: :user_destinations
    has_many :entries
end
