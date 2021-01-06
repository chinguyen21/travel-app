class DestinationsController < ApplicationController
    before_action :not_logged_in

    def index
        @destinations = Destination.all.sort_by &:name
        @countries = Destination.distinct.pluck(:country)
        @states = Destination.distinct.pluck(:state)
        @cities = Destination.distinct.pluck(:city)
        if !params[:country].blank? && !params[:state].blank? && !params[:city].blank?
            @destinations = Destination.where(city: params[:city], country: params[:country], city: params[:city])
        elsif !params[:country].blank? && !params[:state].blank? 
            @destinations = Destination.where(state: params[:state], country: params[:country])
        elsif !params[:country].blank? && !params[:city].blank? 
            @destinations = Destination.where(city: params[:city], country: params[:country])
        elsif !params[:state].blank? && !params[:city].blank? 
            @destinations = Destination.where(city: params[:city], state: params[:state])
        elsif !params[:country].blank?
            @destinations = Destination.where(country: params[:country])
        elsif !params[:state].blank?
            @destinations = Destination.where(state: params[:state])
        elsif !params[:city].blank?
            @destinations = Destination.where(city: params[:city])
        elsif params[:popularity] == "Popularity" && !params[:limit].blank?
            @destinations = Destination.most_popular_destinations.first(params[:limit].to_i)
        elsif params[:popularity] == "Popularity"
            @destinations = Destination.most_popular_destinations
        elsif params[:popularity] == "Rating" && !params[:limit].blank?
            @destinations = Destination.highest_lowest_rating_destinations.first(params[:limit].to_i)
        elsif params[:popularity] == "Rating"
            @destinations = Destination.highest_lowest_rating_destinations
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
