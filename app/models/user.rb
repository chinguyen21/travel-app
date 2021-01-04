class User < ApplicationRecord
    has_many :user_destinations
    has_many :destinations, through: :user_destinations
    has_many :itineraries
    has_many :favorites
    has_many :reviews
    has_many :entries, through: :itineraries
    has_many :event_entries, through: :entries
    has_many :events, through: :event_entries
end
