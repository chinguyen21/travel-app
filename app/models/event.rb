class Event < ApplicationRecord
    belongs_to :destination 
    has_many :entries
    has_many :itineraries, through: :entries
end
