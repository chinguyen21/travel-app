class Destination < ApplicationRecord
    has_many :events
    has_many :user_events, through: :events
    has_many :users, through: :user_events
    has_many :entries, through: :events
    has_many :reviews

    def self.most_popular_destinations
        hash = Hash.new(0)
        Entry.where('visited = true').map {|entry| entry.destination}.each {|d| hash[d]+=1}
        hash.sort_by {|key,value| -value}.map {|a| a[0]}
    end

    def self.highest_lowest_rating_destinations
        h1 = Review.group(:destination).sum(:rating)
        h2 = Review.group(:destination).count
        h1.each {|key,value| h1[key] = value / h2[key].to_f}
        h1.sort_by {|key,value| -value}.map {|a| a[0]}
    end

    def self.highest_rating
        hash = Hash.new(0)
        Review.all.each {|review| hash[review.destination] += review.rating}
        hash
    end
end
