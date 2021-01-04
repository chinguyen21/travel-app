class Event < ApplicationRecord
    belongs_to :destination 
    has_many :event_entries
    has_many :entries, through: :event_entries
end
