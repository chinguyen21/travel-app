class DestinationsController < ApplicationController
    before_action :not_logged_in

    def index
        @user = User.find(session[:id])
        @countries = Country.all
        @states = State.all
        if !params[:state].blank? && !params[:city].blank?
            flash[:alert] = "Choose 1 category to filter at a time"
            @destinations = Destination.all
            redirect_to destinations_path
        elsif !params[:state].blank?
            @destinations = Destination.find_by_state(params[:state])
        elsif !params[:city].blank?
            @destinations = Destination.find_by_city(params[:city])
        elsif params[:category] == "Popularity"
            @destinations = Destination.most_popular_destinations
        elsif params[:category] == "Rating high to low" && !params[:limit].blank?
            @a_destinations = Destination.highest_to_lowest_rating_destinations.first(params[:limit].to_i)
        elsif params[:category] == "Rating high to low"
            @a_destinations = Destination.highest_to_lowest_rating_destinations
        elsif params[:category] == "Rating low to high" && !params[:limit].blank?
            @a_destinations = Destination.lowest_to_highest_rating_destinations.first(params[:limit].to_i)
        elsif params[:category] == "Rating low to high"
            @a_destinations = Destination.lowest_to_highest_rating_destinations
        elsif params[:limit]
            @destinations = Destination.all.first(params[:limit].to_i)
        else
            @destinations = Destination.all
        end

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
