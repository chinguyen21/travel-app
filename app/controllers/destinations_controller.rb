class DestinationsController < ApplicationController
    before_action :not_logged_in
    def index
        @destinations = Destination.all
        @destinations = Destination.where(city = params[:city]) if params[:city].present?
        @destinations = Destination.where(state = params[:state]) if params[:state].present?
        @destinations = Destination.where(country = params[:country]) if params[:country].present?
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
