class DestinationsController < ApplicationController
    before_action :not_logged_in
    def index
        @destinations = Destination.all
    end

    def show
        @destination = Destination.find(params[:id])
        @itineraries = User.find(session[:id]).itineraries
        @entry = Entry.new
        @user = User.find(session[:id])
        @itinerary = Itinerary.new
        @itinerary.entries.build
        @review = Review.new
        @favorite = Favorite.new
    end
end
