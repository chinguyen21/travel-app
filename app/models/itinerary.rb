class Itinerary < ApplicationRecord
    belongs_to :user
    has_many :entries 
    has_many :events, through: :entries 

    validates :name, presence: true
end
