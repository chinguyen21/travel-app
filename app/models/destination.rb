class Destination < ApplicationRecord
    has_many :events
    has_many :user_events, through: :events
    has_many :users, through: :user_events
    has_many :entries, through: :events
    has_many :reviews

    def self.most_popular_destinations
        hash = Hash.new(0)
        Entry.where('visited = true').map {|entry| entry.destination}.each {|d| hash[d]+=1}
        hash.sort_by {|h,k| -k}.map {|a| a[0]}
    end
end
