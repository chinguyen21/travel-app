class User < ApplicationRecord
    has_many :user_destinations
    has_many :destinations, through: :user_destinations
    has_many :itineraries
    has_many :favorites
    has_many :reviews
    has_many :entries, through: :itineraries
    has_many :event_entries, through: :entries
    has_many :events, through: :event_entries


   
    validates :name, presence: true
    validates :age, presence: true
    validates :email, presence: true
    validates :password, presence: true
    validates :email, uniqueness: true
    validates :password, length: {minimum: 8}
    has_secure_password

end
