class Entry < ApplicationRecord
    belongs_to :itinerary
    belongs_to :destination
    has_many :event_entries
    has_many :events, through: :event_entries
end